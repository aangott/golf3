class Match < ActiveRecord::Base
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"
  belongs_to :round
  has_many :scores

  def score_for(player)
    scores.detect { |s| s.player == player }
  end

end
