class Comment < ActiveRecord::Base
    belongs_to :feature, :counter_cache => true
    belongs_to :user
    has_many :logs 
end
