class Userabout < ActiveRecord::Migration
  def self.up
     add_column :users, :about, :text
     add_column :users, :links, :text
  end

  def self.down
  end
end
