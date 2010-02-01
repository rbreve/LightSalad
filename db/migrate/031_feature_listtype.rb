class FeatureListtype < ActiveRecord::Migration
  def self.up
      add_column :features, :listtype, :string, :default=>"SOCIAL"
  end

  def self.down
  end
end
