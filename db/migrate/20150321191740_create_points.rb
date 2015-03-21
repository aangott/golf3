class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :player, index: true
      t.references :match, index: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
