class Categories < ActiveRecord::Migration
  def self.up
    create_table "categories", :force => true do |t|
      t.column "name",        :string
      t.column "category_id",     :integer 
    end
  end

  def self.down
  end
end
