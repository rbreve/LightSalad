class UserGender < ActiveRecord::Migration
  def self.up
      add_column :users, :gender, :string
      
  end

  def self.down
  end
end
