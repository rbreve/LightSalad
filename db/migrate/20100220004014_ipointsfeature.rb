class Ipointsfeature < ActiveRecord::Migration
  def self.up
				add_column :features, :ipoints, :integer, :default => 0
  end

  def self.down
  end
end
