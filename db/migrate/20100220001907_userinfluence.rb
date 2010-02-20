class Userinfluence < ActiveRecord::Migration
  def self.up
		add_column :users, :influence, :integer, :default => 1
		add_column :users, :karma, :integer, :default => 1
  end

  def self.down
  end
end
