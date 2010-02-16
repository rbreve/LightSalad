class UserSessionsController < ApplicationController
before_filter :load_categories

layout "lightsalad"

  def new
		@user = User.new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save do |result|
			if result
      	flash[:notice] = "Successfully Logged in."
      	redirect_back_or_default root_url
    	else
				@user=User.new
      	render :action => 'new'
    	end
		end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
