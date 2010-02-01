class LogCommentId < ActiveRecord::Migration
  def self.up
       add_column :logs, :content, :text
  end

  def self.down
  end
end
