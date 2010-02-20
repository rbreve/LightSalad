class FeatureVote < ActiveRecord::Base
  belongs_to :feature
  belongs_to :user
 
 	before_create :add_fields
	after_save :increase_vote
	
	validates_presence_of :feature_id, :user_id
	validates_uniqueness_of :feature_id, :scope => [:user_id], :unless => :personal_list
	attr_accessor :personal_list, :votes, :feature_title 
	
	private
	
	def add_fields
		self.datetime = Time.now
  	self.ip = ENV['REMOTE_HOST']
		self.value= self.points
	end
	
	def increase_vote
		feature = Feature.find(self.feature_id)
		unless feature.nil?
				current_user=User.find(self.user_id)
				#increase user karma
				
				ipoints=self.points
				
				if(self.points>0)
					ipoints = case current_user.karma
						when -100..99 then 1
						when 100..499 then 2
						when 500..999 then 3
						when 1000..4999 then 4
						when 5000..10000 then 5
					end
				end
				
				author=feature.user
				author.increase_karma(ipoints)
				author.save
				
        feature.points += ipoints
				feature.ipoints += ipoints
        feature.feature_votes_count+=1
        self.votes=feature.feature_votes_count
				self.feature_title = feature.title
				feature.save
				
			
		 
				
		end
	end
		
	
end
