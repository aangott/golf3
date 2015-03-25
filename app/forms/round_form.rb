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
      Round.matches_per_round.times do
        match = round.matches.build
        2.times do 
          match.scores.build
          match.points.build
        end
        @matches << match
      end
    end
  end

  def submit(round_params, match_params)
    return true if round_params.blank? && match_params.blank?
    @round.update_attributes(
      date: parse_date(round_params),
      course: round_params[:course],
      note: round_params[:note]
    )
    match_params.each do |idx, attribs|
      match = @matches[idx.to_i]
      match.update_attributes(
        player1_id: attribs[:player1_id],
        player2_id: attribs[:player2_id],
        sub1_id: (attribs[:player1_sub_used] ? attribs[:sub1_id] : nil),
        sub2_id: (attribs[:player2_sub_used] ? attribs[:sub2_id] : nil)
      )
      assign_outcomes(match, attribs) if @round.in_past?
    end
  end

  def assign_outcomes(match, attribs)
    score1 = match.scores.first
    if attribs[:player1_sub_used]
      score1.update_attributes(
        player_id: match.sub1_id,
        value: attribs[:sub1_score],
        adj_value: attribs[:sub1_adj_score],
      )
    else
      score1.update_attributes(
        player_id: match.player1_id,
        value: attribs[:player1_score],
        adj_value: attribs[:player1_adj_score],
      )
    end
    point1 = match.points.first
    point1.update_attributes(
      player_id: match.player1_id,
      value: attribs[:player1_points]
    )

    score2 = match.scores.last
    if attribs[:player2_sub_used]
      score2.update_attributes(
        player_id: match.sub2_id,
        value: attribs[:sub2_score],
        adj_value: attribs[:sub2_adj_score],
      )
    else
      score2.update_attributes(
        player_id: match.player2_id,
        value: attribs[:player2_score],
        adj_value: attribs[:player2_adj_score],
      )
    end
    point2 = match.points.last
    point2.update_attributes(
      player_id: match.player2_id,
      value: attribs[:player2_points]
    )
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

