# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
#require_gem 'ruby-openid'

class ApplicationController < ActionController::Base



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
 def log(user_id, action, id1, id2, id3=nil)
      
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
        ul.comment_id = id3
       
      end
    
    ul.datetime = Time.now
    ul.user_id = user_id
    ul.action = action
    ul.save
 end
 
 private
 
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