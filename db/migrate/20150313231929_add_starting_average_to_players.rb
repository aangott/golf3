class AddStartingAverageToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :starting_average, :integer
  end
end
