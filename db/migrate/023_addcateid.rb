class Addcateid < ActiveRecord::Migration
  def self.up
     add_column :lists, :category_id, :integer
  end

  def self.down
  end
end
