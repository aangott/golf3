class RoundForm
  include ActiveModel::Model

  attr_accessor :round, :matches

  delegate :date, :course, :note, to: :round

  def self.model_name
    ActiveModel::Name.new(self, nil, "Round")
  end

  def initialize(round, persisted)
    # rails uses persisted? to decide whether to show the new or edit form.
    @persisted = persisted
    @round = round
    if round.persisted?
      @matches = round.matches
    else
      @matches = []
      Round.matches_per_round.times { @matches << round.matches.build }
    end

    if @round.in_past?
      @matches.each { |m| m.ensure_scores_exist }
    end
  end

  def submit(round_params, match_params)
    return true if round_params.blank?
    @round.update_attributes(
      date: parse_date(round_params),
      course: round_params[:course],
      note: round_params[:note]
    )
    match_params.each do |idx, attribs|
      match = @matches[idx.to_i]
      match.update_attributes(
        player1_id: attribs[:player1_id],
        player2_id: attribs[:player2_id]
      )
      assign_scores(match, attribs) if @round.in_past?
    end
  end

  def assign_scores(match, attribs)
    score1 = match.score_for(match.player1)
    if score1
      score1.update_attributes(
        value: attribs[:player1_score],
        adj_value: attribs[:player1_adj_score],
      )
    end
    score2 = match.score_for(match.player2)
    if score2
      score2.update_attributes(
        value: attribs[:player2_score],
        adj_value: attribs[:player2_adj_score],
      )
    end
  end

  def parse_date(hash)
    Date.new(
      hash["date(1i)"].to_i, 
      hash["date(2i)"].to_i, 
      hash["date(3i)"].to_i
    )
  end

  def persisted?
    @persisted
  end

end

