class Logs2 < ActiveRecord::Migration
  def self.up
    create_table "logs", :force => true do |t|
      t.column "datetime",    :datetime
      t.column "user_id",     :integer,                  :null => false
      t.column "name",        :string
      t.column "product_id",  :integer 
      t.column "text",        :text,     :default => "" 
      t.column "comment_id",   :integer,  :default => 0,  :null => false
      t.column "feature_id",  :integer
      t.column "action", :text, :default => ""
    end
  end

  def self.down
  end
end
