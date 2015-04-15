class AddSubScores

  def self.run

    sub_scores = [
      { first_name: 'Ryan', scores: [54, 50, 50, 50] },
      { first_name: 'Ben', scores: [45, 49, 53, 47, 49] },
      { first_name: 'Keith', scores: [39, 36] }
    ]
    sub_scores.each do |data|
      player = Player.find_by_first_name(data[:first_name])
      data[:scores].each do |score|
        Score.create(
          player_id: player.id,
          value: score
        )
      end
    end
  end

end