class Productvote < ActiveRecord::Migration
  def self.up
         add_column :feature_votes, :product_id, :integer, :default => 0
  end

  def self.down
  end
end
