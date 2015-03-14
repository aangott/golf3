class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :date
      t.string :course
      t.string :note

      t.timestamps null: false
    end
  end
end
