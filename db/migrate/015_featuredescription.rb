class Featuredescription < ActiveRecord::Migration
  def self.up
      add_column :features, :description, :text
  end

  def self.down
  end
end
