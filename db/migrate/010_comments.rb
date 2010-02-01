class Comments < ActiveRecord::Migration
  def self.up
     add_column :comments, :feature_id, :integer
  end

  def self.down
  end
end
