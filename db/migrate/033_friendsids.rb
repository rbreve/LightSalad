class Friendsids < ActiveRecord::Migration
  def self.up
     add_column :users, :friend_ids, :text
  end

  def self.down
  end
end
