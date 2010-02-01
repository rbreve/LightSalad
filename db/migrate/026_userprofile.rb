class Userprofile < ActiveRecord::Migration
  def self.up
        add_column :users, :title, :string
  end

  def self.down
  end
end
