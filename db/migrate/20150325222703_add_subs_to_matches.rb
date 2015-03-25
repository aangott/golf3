class AddSubsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :sub1_id, :integer, index: true
    add_column :matches, :sub2_id, :integer, index: true
  end
end
