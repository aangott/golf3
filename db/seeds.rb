# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = [
            {
              first_name: 'Rick',
              last_name: 'Lemanski',
              flight: 'First',
              number: '1',
              scores: [36, 38, 38, 41, 34, 44, 34, 39, 43, 35, 36]
            },
            {
              first_name: 'John',
              last_name: 'Brown',
              flight: 'First',
              number: '2',
              scores: [41, 40, 34, 39, 39, 37, 42, 40, 34, 38, 42]
            },
            {
              first_name: 'Dave',
              last_name: 'Duncan',
              flight: 'First',
              number: '3',
              scores: [40, 39, 36, 37, 40, 43, 38, 41, 42, 40, 46]
            },
            {
              first_name: 'Steve',
              last_name: 'Duggan',
              flight: 'First',
              number: '4',
              scores: [35, 40, 40, 37, 40, 43, 40, 40, 41, 42, 37]
            },
            {
              first_name: 'Dave',
              last_name: 'Nako',
              flight: 'First',
              number: '5',
              scores: [38, 41, 36, 42, 35, 41, 41, 44, 43, 43, 40]
            },
            {
              first_name: 'Tom',
              last_name: 'Luke',
              flight: 'First',
              number: '6',
              scores: [39, 41, 39, 41, 41, 43, 41, 38, 42, 42, 38]
            },
            {
              first_name: 'Sam',
              last_name: 'Schulte',
              flight: 'First',
              number: '7',
              scores: [40, 39, 43, 39, 43, 45, 49, 42, 43, 43, 50]
            },
            {
              first_name: 'Jim',
              last_name: 'Palazzolo',
              flight: 'First',
              number: '8',
              scores: [45, 44, 40, 45, 44, 41, 43, 43, 41, 43, 44]
            },
            {
              first_name: 'Tom',
              last_name: 'MacMillan',
              flight: 'First',
              number: '9',
              scores: [41, 42, 43, 46, 44, 47, 41, 42, 44, 42, 46]
            },
            {
              first_name: 'Bob',
              last_name: 'Kohn',
              flight: 'First',
              number: '10',
              scores: [41, 43, 42, 43, 40, 43, 41, 46, 46, 48, 43]
            },

            {
              first_name: 'Mike',
              last_name: 'Goodvich',
              flight: 'Second',
              number: 'A',
              scores: [44, 42, 43, 45, 45, 46, 41, 45, 42, 41, 39]
            },
            {
              first_name: 'Ron',
              last_name: 'Carson',
              flight: 'Second',
              number: 'B',
              scores: [45, 44, 41, 41, 39, 44, 46, 44, 48, 48, 43]
            },
            {
              first_name: 'John',
              last_name: 'Miles',
              flight: 'Second',
              number: 'C',
              scores: [42, 48, 43, 45, 47, 45, 42, 43, 44, 46, 42]
            },
            {
              first_name: 'Gary',
              last_name: 'Landless', 
              suffix: 'Sr.',
              flight: 'Second',
              number: 'D',
              scores: [44, 44, 41, 47, 47, 43, 44, 45, 47, 45, 44]
            },
            {
              first_name: 'Bob',
              last_name: 'Daniele',
              flight: 'Second',
              number: 'E',
              scores: [44, 47, 48, 45, 42, 49, 46, 48, 45, 49, 49]
            },
            {
              first_name: 'Henry',
              last_name: 'Schoensee',
              flight: 'Second',
              number: 'F',
              scores: [48, 50, 44, 51, 43, 46, 50, 46, 49, 47, 49]
            },
            {
              first_name: 'Bill',
              last_name: 'Hoffsten',
              flight: 'Second',
              number: 'G',
              scores: [48, 44, 44, 48, 51, 47, 45, 54, 48, 47, 50]
            },
            {
              first_name: 'Walt',
              last_name: 'Bassa',
              flight: 'Second',
              number: 'H',
              scores: [47, 52, 43, 50, 47, 48, 47, 42, 48, 58, 42]
            },
            {
              first_name: 'Tom',
              last_name: 'Schwartz',
              flight: 'Second',
              number: 'I',
              scores: [51, 52, 52, 58, 54, 53, 51, 54, 54, 57, 55]
            },
            {
              first_name: 'Ken',
              last_name: 'Murphy',
              flight: 'Second',
              number: 'J',
              scores: [],
              starting_average: 44
            },

            {
              first_name: 'Paul',
              last_name: 'Fisher',
              flight: 'Substitute',
              number: 'Sub',
              scores: [44, 47, 42, 39, 36, 40, 42, 40, 41, 43, 45]
            },
            {
              first_name: 'Chris',
              last_name: 'Orosco',
              flight: 'Substitute',
              number: 'Sub',
              scores: [48, 46, 47, 45, 46, 45, 47, 45, 49, 43, 52]
            },
            {
              first_name: 'Keith',
              last_name: 'Meadows',
              flight: 'Substitute',
              number: 'Sub',
              scores: [40, 39, 41, 34, 38, 42, 46, 44, 41, 39, 35]
            },
            {
              first_name: 'Ben',
              last_name: 'Schulte',
              flight: 'Substitute',
              number: 'Sub',
              scores: [44, 52, 54, 48]
            },
            {
              first_name: 'Ryan',
              last_name: 'Duffy',
              flight: 'Substitute',
              number: 'Sub',
              scores: []
            }
          ]

players.each do |player_data| 
  scores = player_data.delete(:scores).reverse
  new_player = Player.create(player_data)
  scores.each do |score|
    Score.create(
      player_id: new_player.id,
      value: score
    )
  end
end
