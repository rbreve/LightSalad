class Commentdate < ActiveRecord::Migration
  def self.up
     add_column :comments, :datetime, :datetime
  end

  def self.down
  end
end
