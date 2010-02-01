class Commentcounter < ActiveRecord::Migration
  def self.up
      add_column :features, :comments_count, :integer, :default => 0
  end

  def self.down
  end
end
