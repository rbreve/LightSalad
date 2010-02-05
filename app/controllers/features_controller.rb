
class FeaturesController < ApplicationController
  layout "lightsalad"
  before_filter :current_user, :only => [:create, :new]
  
  
  def new
      @feature = Feature.new
      @list = List.find(params[:list_id])
       
  end
  
  def create
    @list = List.find(params[:list_id])
    @feature = Feature.new(params[:feature])
    @feature.user_id = current_user.id
    @feature.datetime=Time.now
    @feature.list_id = @list.id
    @feature.feature_votes_count=0
    @feature.listtype=@list.listtype
    
    
    if @feature.save
      #flash[:notice] = "Item Added!" 
      #log( session["person"].id, "NEW_FEATURE_SOCIAL", @feature.list_id, @feature.id)
      redirect_to list_url(@list) + "##{@feature.id}"
    end
    
  end
  
  
  def whovoted
    @feature = Feature.find(params[:id] )
    @liked = User.find(:all, :joins => ", feature_votes", :conditions => "feature_votes.points = 1 and feature_votes.feature_id = #{@feature.id} and feature_votes.user_id = users.id", :limit=>20)
    @disliked = User.find(:all, :joins => ", feature_votes", :conditions => "feature_votes.points = -1 and feature_votes.feature_id = #{@feature.id} and feature_votes.user_id = users.id", :limit=>20)
    @list = List.find(@feature.list_id)

  end
  
end
