class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :round, index: true
      t.integer :player1_id, index: true
      t.integer :player2_id, index: true
    end
  end
end
