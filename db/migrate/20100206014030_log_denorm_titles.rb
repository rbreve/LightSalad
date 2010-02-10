class LogDenormTitles < ActiveRecord::Migration
  def self.up
		add_column :logs, :list_title, :text
		add_column :logs, :feature_title, :text
		add_column :logs, :username, :text
		add_column :logs, :username2, :text
  end

  def self.down
  end
end
