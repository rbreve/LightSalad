class FeatureVote < ActiveRecord::Base
  belongs_to :feature
  belongs_to :user
 
 	before_create :add_fields
	after_save :increase_vote
	
	validates_presence_of :feature_id, :user_id
	validates_uniqueness_of :feature_id, :scope => [:user_id], :unless => :personal_list
	attr_accessor :personal_list, :votes
	
	private
	
	def add_fields
		self.datetime = Time.now
  	self.ip = ENV['REMOTE_HOST']
		self.value= self.points
	end
	
	def increase_vote
		feature = Feature.find(self.feature_id)
		unless feature.nil?
        feature.points += self.points
        feature.feature_votes_count+=1
        self.votes=feature.feature_votes_count
				feature.save
				
		end
	end
		
	
end
