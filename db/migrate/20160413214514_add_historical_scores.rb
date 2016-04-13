class AddHistoricalScores < ActiveRecord::Migration
  def change
    players = [
      {
        first_name: 'Dave',
        last_name: 'Dely',
        scores: [47, 47, 46, 49, 46, 52, 42, 49, 46, 42, 49]
      },
      {
        first_name: 'Brandon',
        last_name: 'Dobbins',
        scores: [46, 47, 44, 46]
      },
      {
        first_name: 'Ben',
        last_name: 'Schulte',
        scores: [49, 49, 50, 44, 48]
      },
      {
        first_name: 'Paul',
        last_name: 'Fisher',
        scores: [41, 43, 36]
      },      
      {
        first_name: 'Ryan',
        last_name: 'Duffy',
        scores: [42]
      }
    ]
    ActiveRecord::Base.transaction do
      players.each do |player|
        p = Player.find_by!(
          first_name: player[:first_name], 
          last_name: player[:last_name]
        )

        player[:scores].reverse.each do |score|
          Score.create!(
            player: p,
            value: score
          )
        end
      end
    end
  end
end
