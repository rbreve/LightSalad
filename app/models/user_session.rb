class UserSession < Authlogic::Session::Base
	
	  def self.oauth_consumer
      OAuth::Consumer.new(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET,
      { :site=>"http://twitter.com",
        :authorize_url => "http://twitter.com/oauth/authenticate" })
    end
		
		#after_create :getinfo
		
		after_create :update_user
		
		private
		
		def update_user
			require 'open-uri'
	
			if self.user.twitter_uid
				buffer=open("http://api.twitter.com/1/users/show.json?user_id="+self.user.twitter_uid).read
				user_info = JSON.parse(buffer)
				self.user.avatar_url  = user_info['profile_image_url']
 			end
		end
end