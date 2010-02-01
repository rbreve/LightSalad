class TagCategory < ActiveRecord::Migration
  def self.up
    add_column :tags, :category_id, :integer, :default => 0
  end

  def self.down
  end
end
