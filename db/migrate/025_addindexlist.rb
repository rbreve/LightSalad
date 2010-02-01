class Addindexlist < ActiveRecord::Migration
  def self.up
    add_index :lists, :category_id
  end

  def self.down
    remove_index :lists, :category_id
  end
end
