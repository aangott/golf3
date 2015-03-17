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
      @matches.each do |match|
        match.scores.build(player: match.player1) unless match.score_for(match.player1)
        match.scores.build(player: match.player2) unless match.score_for(match.player2)
      end
    end
  end

  def submit(params)
    return true if params.blank?
    @round.update_attributes(
      date: parse_date(params),
      course: params[:course],
      note: params[:note]
    )
    params[:matches_attributes].each do |idx, attribs|
      @matches[idx.to_i].update_attributes(
        player1_id: attribs[:player1_id],
        player2_id: attribs[:player2_id]
      )
    end
  end

  def matches_attributes=(attributes)
    # this is needed for rendering fields_for :matches, but doesn't seem to
    # be called since the RoundForm object doesn't get saved.
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

