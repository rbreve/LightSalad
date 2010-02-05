class User < ActiveRecord::Base

	acts_as_authentic

has_many :lists
has_many :feature_votes
has_many :features, :through => :feature_votes
has_many :logs
has_many :friends, :foreign_key => "user_id"
has_many :comments

# validates_format_of :lastname, :with =>/^ENSALADA$/, :message => "Invite Code Invalid"
# validates_uniqueness_of :username, :case_sensitive => false
# validates_format_of       :username, :with => /^[a-z]{2}(?:\w+)?$/i
# validates_presence_of :name, :email, :password, :username
# validates_uniqueness_of :email, :username
# validates_confirmation_of :password, :message => "Passwords should match "

before_save   { |u| u.email.downcase! if u.email }


# def self.authenticate(email, pass)
#          find(:first,:conditions => [ "email = ? AND password =?", email, pass ])
#     end
before_create :populate_oauth_user
  
private

  def populate_oauth_user
    unless oauth_token.blank?
      @response = UserSession.oauth_consumer.request(:get, '/account/verify_credentials.json',
      access_token, { :scheme => :query_string })
      case @response
      when Net::HTTPSuccess
        user_info = JSON.parse(@response.body)
				screen_name = user_info['screen_name']
        self.login =  "twitter_#{user_info['screen_name']}"
        self.name        = user_info['name']
        self.twitter_uid = user_info['id']
				self.about = user_info['description']
        self.avatar_url  = user_info['profile_image_url']
      end
    end
  end
 
end
