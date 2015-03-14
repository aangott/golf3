# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = [{first_name: 'Rick',
            last_name: 'Lemanski',
            flight: 'first',
            number: '1'},
                     
           {first_name: 'Dave',
            last_name: 'Nako',
            flight: 'First',
            number: '2'},

           {first_name: 'John',
            last_name: 'Brown',
            flight: 'First',
            number: '3'},

           {first_name: 'Dave',
            last_name: 'Duncan',
            flight: 'First',
            number: '4'},

           {first_name: 'Steve',
            last_name: 'Duggan',
            flight: 'First',
            number: '5'},

           {first_name: 'Tom',
            last_name: 'Luke',
            flight: 'First',
            number: '6'},

           {first_name: 'Paul',
            last_name: 'Fisher',
            flight: 'First',
            number: '7'},

           {first_name: 'Bob',
            last_name: 'Kohn',
            flight: 'First',
            number: '8'},

           {first_name: 'Tom',
            last_name: 'MacMillan',
            flight: 'First',
            number: '9'},

           {first_name: 'Mike',
            last_name: 'Goodvich',
            flight: 'First',
            number: '10'},

           {first_name: 'Ron',
            last_name: 'Carson',
            flight: 'First',
            number: '11'},

           {first_name: 'Jim',
            last_name: 'Palazzolo',
            flight: 'First',
            number: '12'},

           {first_name: 'John',
            last_name: 'Miles',
            flight: 'Second',
            number: 'A'},

           {first_name: 'Henry',
            last_name: 'Schoensee',
            flight: 'Second',
            number: 'B'},
                         
           {first_name: 'Gary',
            last_name: 'Landless', 
            suffix: 'Sr.',
            flight: 'Second',
            number: 'C'},

           {first_name: 'Walt',
            last_name: 'Bassa',
            flight: 'Second',
            number: 'D'},

           {first_name: 'Dave',
            last_name: 'Dely',
            flight: 'Second',
            number: 'E'},

           {first_name: 'Bob',
            last_name: 'Daniele',
            flight: 'Second',
            number: 'F'},

           {first_name: 'Sam',
            last_name: 'Schulte',
            flight: 'Second',
            number: 'G'},

           {first_name: 'Bill',
            last_name: 'Hoffsten',
            flight: 'Second',
            number: 'H'},

           {first_name: 'Dave',
            last_name: 'Bair',
            flight: 'Second',
            number: 'I'},

           {first_name: 'Tom',
            last_name: 'Schwartz',
            flight: 'Second',
            number: 'J'},

           {first_name: 'Keith',
            last_name: 'Meadows',
            flight: 'Substitute',
            number: 'Sub'},

           {first_name: 'Ben',
            last_name: 'Schulte',
            flight: 'Substitute',
            number: 'Sub'}]

players.each { |player_data| Player.create(player_data) }
