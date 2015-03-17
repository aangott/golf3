class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :player, index: true
      t.references :match, index: true
      t.integer :value
      t.integer :adj_value

      t.timestamps null: false
    end
  end
end
