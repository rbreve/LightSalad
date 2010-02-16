# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
#require_gem 'ruby-openid'

class ApplicationController < ActionController::Base

	helper_method :current_user

 def gen_captcha
    chars = ("a".."v").to_a + ("1".."2").to_a 
    random = Array.new(5, '').collect{chars[rand(chars.size)]}.join
    return random
 end
 
 def logfeature(list_id, feature_id)
   
    ul = Log.new
    ul.list_id = list_id
    ul.feature_id = feature_id
     ul.datetime = Time.now
      ul.user_id = session["person"].id
      ul.action = "NEW_FEATURE_SOCIAL"
      ul.save
 end
 
 #id1 = list_id
 #id2 = feature_id
 def log(user_id, action, id1, id2, comment_id, list_title, item_title, username, username2)
      
		logger.debug "log; #{user_id} #{action} #{id1}"
      ul = Log.new
      
      if (action =~ /NEW_LIST(\w+)$/)
        ul.list_id = id1
      end
       
      if (action =~ /NEW_FEATURE_(\w+)$/) or action == "VOTE_UP" or action == "VOTE_DOWN"
        ul.list_id = id1 
        ul.feature_id = id2
      end
      
      if(action =~ /NEW_COMMENT/)
        ul.list_id = id1
         ul.feature_id = id2
        ul.comment_id = comment_id
       
      end
    
    ul.datetime = Time.now
    ul.user_id = user_id
    ul.action = action
		ul.list_title=list_title
		ul.item_title=item_title
		ul.username=username
		ul.username2=username2
    ul.save
 end
 
 private

def current_user_session
		return @current_user_session if defined?(@current_user_session)
		@current_user_session = UserSession.find
end 

def current_user
	return @current_user if defined?(@current_user)
	@current_user=current_user_session && current_user_session.record
end

def require_user
   unless current_user
     store_location
     flash[:notice] = "You must be logged in to access this page"
     redirect_to new_user_session_url
     return false
   end
 end
  
	def store_location
     session[:return_to] = request.request_uri
  end
	
	def redirect_back_or_default(default)
		redirect_to(session[:return_to] || default)
		session[:return_to] = nil
	end 

def adjust_format_for_iphone 
  
   if request.domain != nil
     if request.domain.split(".")[0] == "iphone" 
       request.format = :iphone
     end
   end
 end
 
   def authenticate
     unless session["person"]
       redirect_to :controller => "/user/signin" 
      return false
     end
   end
   
   def load_categories
       @categories = Category.find(:all, :conditions=>"category_id=0")
    end
 
end