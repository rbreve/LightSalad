class UserSession < Authlogic::Session::Base
	  def self.oauth_consumer
      OAuth::Consumer.new("18En6vEKezJVixDrFkWjA", "tRAIFXAoCAGyFL3UVAvbNuAPQBHYPsLspw0brHfSP9Y",
      { :site=>"http://twitter.com",
        :authorize_url => "http://twitter.com/oauth/authenticate" })
    end
end