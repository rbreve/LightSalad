class Votesinfluence < ActiveRecord::Migration
  def self.up
				add_column :feature_votes, :ipoints, :integer, :default => 0
  end

  def self.down
  end
end
