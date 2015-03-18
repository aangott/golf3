class Match < ActiveRecord::Base
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"
  belongs_to :round
  has_many :scores

  def score_for(player)
    scores.detect { |s| s.player == player }
  end

  def ensure_scores_exist
    scores.build(player: player1) unless score_for(player1)
    scores.build(player: player2) unless score_for(player2)
  end

end
