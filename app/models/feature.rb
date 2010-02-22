

class Feature < ActiveRecord::Base  
  belongs_to :list, :counter_cache=>true
  belongs_to :user
  has_many :feature_votes
  has_many :users, :through => :feature_votes, :select => 'DISTINCT users.*'
  has_many :comments
  validates_presence_of :title
end
