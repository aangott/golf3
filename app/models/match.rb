class Match < ActiveRecord::Base
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"
  belongs_to :round
  has_many :scores
  has_many :points

  delegate :date, to: :round
  delegate :this_year?, to: :round

  def score_for(player)
    scores.detect { |s| s.player == player }
  end

  def points_for(player)
    points.detect { |p| p.player == player }
  end

  def scored?
    scores.flat_map(&:value).any?
  end

end
