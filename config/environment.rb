 
ENV['RAILS_ENV'] ||= 'development'

RAILS_GEM_VERSION = '2.3.8'
IMAGE_DIR = "/images/"
VOTE_UP_ICON = "voteup.png"
VOTE_DOWN_ICON = "votedown.png"
UPLOAD_PATH = "/userimages/"
PRIVATE_LIST = 1
USE_RECAPTCHA = false

TWITTER_CONSUMER_KEY = ""
TWITTER_CONSUMER_SECRET =  ""

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = {
     :session_key => '_salad_session',
     :secret      => '6a9f6e0b90fe45ecce83c34dc8d1e991974dbec73c24735d45fa98bcfdd2744a70f4f029881548e59ba8020b3146bcce9fbeef55c0bd4fe8bf0e61556501852c'
   }
   
   
 

ENV['RECAPTCHA_PUBLIC_KEY']  = 'YOUR_RECAPTCHA_PUBLIC_KEY'
ENV['RECAPTCHA_PRIVATE_KEY'] = 'YOUR_RECAPTCHA_PRIVATE_KEY'

	
	config.gem "recaptcha", :lib => "recaptcha/rails"
  config.gem "authlogic"
	config.gem "oauth"
#	config.gem "mechanize"
#	config.gem "mysql"
  config.gem "sqlite3"
  config.gem  "will_paginate"
	config.gem "json"
	config.gem "authlogic-oauth", :lib => "authlogic_oauth"
	#config.gem "thinking-sphinx", :lib => "	thinking_sphinx", :version => "1.3.15"
  
end
 