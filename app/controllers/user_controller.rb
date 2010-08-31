
#require_gem 'ruby-openid'
class UserController < ApplicationController

layout "salad"
   def signup
     session['captcha']=gen_captcha
     @user = params[:id]
	 end
	 
	 def create_user
	    @captcha = params[:captcha]
	    
      unless params[:captcha].to_s == session['captcha'].to_s
        flash[:notice] = "Incorrect Image Text, Try Again"
        redirect_to :action => "signup" 
        return false
      end
	      @user=User.new(params[:user])
	      @user.date_reg = Time.now
	      @user.status = 1
	      @user.image = "noimage.png"
	      
        if @user.save
          flash[:notice] = 'Signup Succesfull, Please Login with your email and password'
          redirect_to :action => 'signin'
        else

          render :action => 'signup'
        end
	 end
	 
	 def signin
	 end
 
  def edit_password
   
     @user=User.find(session["person"].id)
 
  end
  
  def update_password
      u = params[:user]
      @user = User.find(session["person"].id)

      if @user.password==params[:password]
        if u[:password]== u[:password_confirmation]
          @user.password=u["password"]
          @user.save
          flash[:notice] = 'Your password has been updated.'
          redirect_to user_url(@user)
        else
          flash[:notice] = "Passwords dont match"
          render :action => "edit_password"
        end
      else
         flash[:notice] = 'Your current password is wrong.'
         redirect_to :action => "edit_password"
        return
      end 
      
  end
	  
	 
	 def update_user
	   user=User.find(params[:id])
	   if session["person"].id != @user.id
 	     redirect_to :action => "show", :id => session["person"].id
 	   end
 	   u.update_attributes(params[:user])	   
	 end
	 
	 
	 def edit
	   @user=User.find(:first, :conditions=>["username =?", params[:id]])
	   if session["person"].id != @user.id
	     redirect_to :action => "show", :id => session["person"].id
	   end
   end
   
   
	
   def show
    @user=User.find(params[:id  ])
    @likes = FeatureVote.find(:all, :conditions => "user_id = #{@user.id} and value = 1", :limit=>20)
    @dislikes = FeatureVote.find(:all, :conditions => "user_id = #{@user.id} and value = 0", :limit=>20)
    @comments = Comment.find(:all, :conditions => "user_id = #{@user.id}", :limit=>10)
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @rumor }
      end
    end
 
 
   def login
     from = params[:from]
     if session["person"] = User.authenticate(params['user']['email'], params['user']['password'])
       if from  
            redirect_to from
      else
        
        redirect_to :controller => "lists"
      end
     else
       flash[:notice] = "Access Denied for user "  
       redirect_to :action => "signin" 
     end	
   end
	 
	def logout
	   session["person"] = nil
     flash[:notice] = "Logged out"
     redirect_to(:action => "signin" )
	end
	 
	def account
	 	unless session["person"]
          redirect_to :action => 'signin'
		  return false
		end
		@user = User.find(session["person"].id)
	end
	
	def image
      @filename=upload_image(params[:image_filename] )
      # if @filename
      #           @user = User.find(session["person"].id)
      #           @user.image = @filename
      #           @user.update
      #       end
  end
  
  
  def cropimage
    #@image=User.find(session["person"].id).image
    # @image = params[:filename]
    #    @x1=params[:x1]
    #    @y1=params[:y1]
    #    @x2=params[:x2]
    #    @y2=params[:y2]
    #    path = "public" + UPLOAD_PATH + @image
    #    img = Magick::ImageList.new(path)		
    #    img = img.crop!(@x1.to_i, @y1.to_i, @x2.to_i-@x1.to_i, @y2.to_i - @y1.to_i)
    #    img.resize!(60,60)
    #    img.write(path)
    #    @user = User.find(session["person"].id)
    #    @user.image = @image
    #    @user.update
  end
  
  def upload_image(archivo)
	  
	  chars = ("a".."z").to_a + ("1".."9").to_a 
    random = Array.new(5, '').collect{chars[rand(chars.size)]}.join
    
       
	   if archivo.length > 0
        filename = random + archivo.original_filename.downcase	
        ext = filename.slice(-3,3)
        img_dir = "public" + UPLOAD_PATH
        path = img_dir + filename
        File.open(path, "wb") { |f| f.write(archivo.read) }	
	     else
	       filename = ""
	     end
	     filename
	 
	 end
	
 def activate
	   k = params[:id]
	   u=User.find(:first, :conditions=>["facebook = ?", k])
	   if u
	     u.status=0
	     u.save
	   #  flash[:notice] = 'Thank You! Your account has been activated! Now you can signin.'
	     redirect_to :action => 'signin', :id => "3"
	   else
	     flash[:notice] = 'Confirmation error, please verify that your confirmation link is valid and try again'
	     redirect_to :action => 'signin'
	   end
	 end
	 
	
	
	def post
    unless session["person"]
      redirect_to :action => 'signin'
      return false
    end
    chars = ("a".."e").to_a + ("1".."2").to_a 
    random = Array.new(5, '').collect{chars[rand(chars.size)]}.join
    session["captcha"] = random.to_s 
	end  
	 
	
	#create new list
	def create_post
	    
	    unless params[:captcha] == session['captcha']
	      flash[:notice] = "Incorrect Image Text, Try Again"
	      render :action => "post" 
	      return false
      end
	    
      product = params[:product]
      ptags = params[:product][:tags]
      listtype = params[:product][:listtype]
       
    	p = Product.new(product)
    
      if listtype == "friends"
          log_action = "NEW_LIST_FRIEND"
          p.listtype=1
      elsif listtype == "public"
          log_action = "NEW_LIST"
          p.listtype=0
      elsif listtype =="personal"
          log_action = "NEW_LIST_PERSONAL"
          p.listtype=2
      end
    
    	 p.datetime = Time.now
    	 p.user_id = session["person"].id
    	 p.status_id=1
    	 p.lastupdate = Time.now
    
    	 #add tags to db
    	 tags =  ptags.split
    	 for tag in tags do
    	   mytag  = Tag.find(:all, :conditions => ["name = ?", tag])
    	   if mytag.empty?
    	     newtag = Tag.new
    	     newtag.name = tag
    	     newtag.n= 1
    	     newtag.save
  	     else
  	      mytag = Tag.find(:first, :conditions => ["name = ?", tag])
  	      mytag.n = mytag.n + 1
  	      mytag.update
  	     end
  	   end
  	   
       p.save
       if p.save
         redirect_to :controller => "salad", :action => "view", :id => p 
       end
	end
 
	
	def openid_signin
	end
	
	def complete
	  response = openid_consumer.complete params

      if response.status == OpenID::SUCCESS
        session[:openid] = response.identity_url
        # the user is now logged in with OpenID!
        redirect_to   :controller => "salad", :action => "view" 
        return
      end

      flash[:error] = 'Could not log on with your OpenID'
      redirect_to :action => :openid_signin
	end
	
	
	def openid_login
	
	   openid_url = params[:openid_url]
       response = openid_consumer.begin openid_url

      if response.status == OpenID::SUCCESS
          redirect_url = response.redirect_url("http://127.0.0.1:3000/","http://127.0.0.1:3000/user/complete")
          redirect_to redirect_url
          return
      end

      flash[:error] = "Couldn't find an OpenID for that URL"
      render :action => :openid_signin

	end
	 
	 
	protected

    def openid_consumer
      @openid_consumer ||= OpenID::Consumer.new(session,OpenID::FilesystemStore.new("#{RAILS_ROOT}/tmp/openid"))
    end
	 
	 
	
	 
end

	
  

