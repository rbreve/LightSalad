class LogsController < ApplicationController
layout "lightsalad"
before_filter :load_categories

#url called is /activity

	def index
		page = params[:page]
		@feed = params[:feed]
		@user=current_user
   	#@logs=Log.find(:all)
		if not @feed
			@feed="recent"
		end
		
		if (@feed == "friends" or @feed == "mylists" or @feed == "mine") and (not current_user)
				redirect_to login_path
				return
		end
		
		if @feed=="friends" 
			fids=Array.new
    	friends = Friend.find(:all, :conditions => "user_id = #{@user.id}")
    	friends.each {|f| fids <<  f.friend_id}
			#fids << current_user.id
 			@logs = Log.paginate(:all, :conditions => {:user_id => fids}, :order=>"datetime desc",:page=>page)
		elsif @feed == "mylists"
				@logs = Log.paginate(:all, :conditions=>["user_id=? and action='NEW_LIST_SOCIAL'",@user.id], :order=>"datetime desc",:page=>page)
		elsif @feed == "mine"
 				@logs = Log.paginate(:all, :conditions=>["user_id=?",@user.id], :order=>"datetime desc",:page=>page)
			else
			@logs = Log.paginate(:all, :order=>"id desc", :page=>page)
		end
	end
  
	

  def show
    @log = Log.find(params[:id])
  end
  
  def new
    @log = Log.new
  end
  
  def create
    @log = Log.new(params[:log])
    if @log.save
      flash[:notice] = "Successfully created log."
      redirect_to @log
    else
      render :action => 'new'
    end
  end
  
  def edit
    @log = Log.find(params[:id])
  end
  
  def update
    @log = Log.find(params[:id])
    if @log.update_attributes(params[:log])
      flash[:notice] = "Successfully updated log."
      redirect_to @log
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    flash[:notice] = "Successfully destroyed log."
    redirect_to logs_url
  end
end
