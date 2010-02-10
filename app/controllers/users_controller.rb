class UsersController < ApplicationController
before_filter :load_categories
layout "lightsalad"
before_filter :current_user, :only => [:addtofriend]



  def show

    @taste=params[:taste]
    page = params[:page]
    
    @user=User.find(:first, :conditions => ["login = ?", params[:id]])
    
    # @likes = FeatureVote.find(:all, :conditions => "user_id = #{@user.id} and value = 1", :limit=>20)
    #    @dislikes = FeatureVote.find(:all, :conditions => "user_id = #{@user.id} and value = 0", :limit=>20)
    
    #@likes = FeatureVote.find(:first, :conditions => "user_id = #{@user.id} and value = 1")
    #@hates = FeatureVote.find(:first, :conditions => "user_id = #{@user.id} and value = 0")
    
    @comments = Comment.find(:all, :conditions => "user_id = #{@user.id}", :limit=>10)
   
    fids=""
    friends = Friend.find(:all, :conditions => "user_id = #{@user.id}")
    friends.each {|f| fids += "user_id = " + f.friend_id.to_s + " or "}
    fids = fids[0, fids.size-3]
    
    if @taste == "likes"
      @logs = Log.paginate(:all, :conditions=>["user_id=? and action='VOTE_UP'",@user.id], :order=>"datetime desc", :page=>page)
    elsif @taste == "hates"
      @logs = Log.paginate(:all, :conditions=>["user_id=? and action='VOTE_DOWN'",@user.id], :order=>"datetime desc", :page=>page)
    elsif @taste == "lists"
      if current_user and current_user.id == @user.id
        sql_private = "or action='NEW_LIST_PERSONAL'"
      end
      @logs = Log.paginate(:all, :conditions=>["user_id=? and action='NEW_LIST_SOCIAL' #{sql_private}",@user.id], :order=>"datetime desc", :page=>page)
    elsif @taste == "friends"
       @logs = Log.paginate(:all, :conditions=> fids, :page=>page)
    else
      @taste = "activity"
      @logs = Log.paginate(:all, :conditions=>["user_id=?",@user.id], :order=>"datetime desc",:page=>page)
    end
    
		begin
     	current_user.id
		  @isyourfriend=Friend.find(:first,:conditions=>["user_id=? and friend_id=?",current_user.id, @user.id])
		rescue RuntimeError
			#nada
    end
    
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @rumor }
      end
    end
    
    def crop_picture
      @filename=upload_image(params[:image_filename] )
      
    end
    
    def upload_picture
    end
    
    def update_picture
        #CROPS
        #@image=User.find(current_user.id).image
        @image = params[:filename]
        @x1=params[:x1]
        @y1=params[:y1]
        @x2=params[:x2]
        @y2=params[:y2]
        path = "public" + UPLOAD_PATH + @image
        img = Magick::ImageList.new(path)		
        img = img.crop!(@x1.to_i, @y1.to_i, @x2.to_i-@x1.to_i, @y2.to_i - @y1.to_i)
        img.resize!(60,60)
        img.write(path)
        @user = User.find(current_user.id)
        @user.image = @image
        @user.save
       flash[:notice] = "Your avatar has been updated"
       redirect_to  user_path(@user.login)
    end
    
    def add_friend
    end
     
   def new
     @user = User.new
   end
    
		def create
			@user=User.new(params[:user])
			@user.date_reg = Time.now
	    @user.status = 1
	    @user.image = "noimage.png"
	
			@user.save do |result|
				if result
 					flash[:notice] = "Registration successful"
					redirect_to :controller => "lists"
 				else
					unless @user.oauth_token.nil?
						@user = User.find_by_oauth_token(@user.oauth_token)
						unless @user.nil?
							UserSession.create(@user)
							flash.now[:message] = "Welcome back!"
							redirect_to root_url
						else
							render :action => 'new'
						end
					else
						render :action => 'new'
					end
				end
			end
		end

		def update
			@user = current_user
			@user.attributes = params[:user]
			@user.save  do |result|
				if result
					flash[:notice] = "Succesfully updated"
					redirect_to root_url
				else
					@genders = [ 'Male','Female']
					render :action => "edit"
				end
			end
		end

    def addtofriend
       f=Friend.new
       f.user_id = current_user.id
       f.friend_id = params[:id]
       f.save
        render(:layout => false)  
     end
    
     # GET /categories/1/edit
     def edit
	     @genders = [ 'Male','Female']
       @user = current_user
     end
    
    def edit_password
       @user=User.find(current_user.id)
    end
    
    def edit_profile
     @gender = [ 'Male','Female']
      @user = User.find(current_user.id)
    end
    
    def update_profile
      user = params[:user]
      @user = User.find(current_user.id)
      @user.about = user[:about]
      @user.links = user[:links]
      @user.name = user[:name]
      @user.gender = user[:gender]
      if @user.save
        flash[:notice] = "Information Updated"
        redirect_to user_url(@user.login)
      end
    end

    def update_password
        u = params[:user]
        @user = User.find(current_user.id)

        if @user.password==params[:password]
          if u[:password]== u[:password_confirmation] 
            @user.password=u["password"]
            if @user.save
              flash[:notice] = 'Your password has been updated.'
              redirect_to user_url(@user.login)
            else
              render :action => "edit_password"
            end
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
    
  protected
  
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
end
