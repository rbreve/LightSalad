class Category < ActiveRecord::Base
  has_many :lists
  
  def to_param 
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}" 
  end 
  

end
