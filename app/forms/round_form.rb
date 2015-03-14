class RoundForm
  include ActiveModel::Model

  attr_accessor :round

  delegate :date, :course, :note, to: :round

  def initialize(round)
    @round = round
  end

  def submit(params)
    binding.pry
    true
  end

end