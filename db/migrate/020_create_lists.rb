class CreateLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :comments_count, :integer, :default => 0
  end

  def self.down
    drop_table :lists
  end
end
