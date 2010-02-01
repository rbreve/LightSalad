class Viewslist < ActiveRecord::Migration
  def self.up
    add_column :lists, :views_count, :integer, :default=>0
  end

  def self.down
  end
end
