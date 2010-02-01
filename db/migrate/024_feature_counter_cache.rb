class FeatureCounterCache < ActiveRecord::Migration
  def self.up
     add_column :lists, :features_count, :integer, :default => 0
  end

  def self.down
  end
end
