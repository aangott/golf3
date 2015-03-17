class RoundForm
  include ActiveModel::Model

  attr_accessor :round, :matches

  delegate :date, :course, :note, to: :round

  def initialize(round)
    @round = round
    if round.persisted?
      @matches = round.matches
    else
      @matches = []
      Round.matches_per_round.times { @matches << round.matches.build }
    end
  end

  def submit(params)
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

end

