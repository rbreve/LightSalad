class Product < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 10
  
  has_many :features
  belongs_to :user
  has_many :logs
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def type
    if listtype==0
      return "PUBLIC"
    elsif listtype==1
      return "FRIEND"
    elsif listtype == 2
      return "PRIVATE"
    end
  end
end
