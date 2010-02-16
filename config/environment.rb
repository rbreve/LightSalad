# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5'
IMAGE_DIR = "/images/"
VOTE_UP_ICON = "voteup.png"
VOTE_DOWN_ICON = "votedown.png"
UPLOAD_PATH = "/userimages/"
PRIVATE_LIST = 1
# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = {
     :session_key => '_salad_session',
     :secret      => '6a9f6e0b90fe45ecce83c11dc8d1e991974dbec73c24735d45fa98bcfdd2744a70f4f029881548e59ba8020b3146bcce9fbeef55c0bd4fe8bf0e61556501852c'
   }
   
   
  # Settings in config/environments/* take precedence those specified here
  
  # Skip frameworks you're not going to use (only works if using vendor/rails)
  # config.frameworks -= [ :action_web_service, :action_mailer ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
 	ENV['RECAPTCHA_PUBLIC_KEY']  = '6Ld4OwsAAAAAAKodHOCrhhkROuO8itcTSCJxijJ_'
  ENV['RECAPTCHA_PRIVATE_KEY'] = '6Ld4OwsAAAAAACnEkko49-2XcbXpU8oa2LDvy6my'
	
	config.gem "recaptcha", :lib => "recaptcha/rails"
  config.gem "authlogic"
	config.gem "oauth"
	config.gem "mechanize"
	config.gem "mysql"
	config.gem "json"
	config.gem "authlogic-oauth", :lib => "authlogic_oauth"
	#config.gem "thinking-sphinx", :lib => "	thinking_sphinx", :version => "1.3.15"
 
  # Force all environments to use the same logger level 
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Use the database for sessions instead of the file system
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper, 
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  
  # See Rails::Configuration for more options
end

# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#require 'acts_as_ferret'
# Include your application configuration below