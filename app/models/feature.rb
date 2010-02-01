

class Feature < ActiveRecord::Base  
  belongs_to :list, :counter_cache=>true
  belongs_to :user
  has_many :feature_votes
  has_many :users, :through => :feature_votes, :select => 'DISTINCT users.*'
  has_many :comments
   
  acts_as_ferret :fields => [:title, :description]
  
  private
  
  def after_save
     log( session["person"].id, "NEW_FEATURE_SOCIAL", self.list_id, self.id)
  end
  
end
