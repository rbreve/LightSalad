class FeatureVotesController < ApplicationController
before_filter :require_user, :only => [:create, :new]


  def index
    @feature_votes = FeatureVote.all
  end
  
  def show
    @feature_votes = FeatureVote.find(params[:id])
  end
  
  def new
    @feature_votes = FeatureVote.new
  end
  
	# vote
  def create
		list_id=params[:list_id]
		points=params[:points]
		feature_id = params[:feature_id]
    @feature_votes = FeatureVote.new(:list_id=>list_id, :points=>points, :feature_id=>feature_id, :user_id=>current_user.id)
		
		list=List.find(@feature_votes.list_id) 
		if list.listtype == "PERSONAL"
			@feature_votes.personal_list=1
    end
		
		if points 
			action = "VOTE_UP"
		else
			action= "VOTE_DOWN"
		end
		
		if @feature_votes.save
			@votes = @feature_votes.points
      @msg = "VOTED"
			list.lastupdate = Time.now
      list.points += @feature_votes.points
      list.save  
			
			#logs activity
			log = Log.new(:action=>action, :user_id=>current_user.id, :list_id=>list_id, :feature_id=>feature_id, :list_title=>list.name, :feature_title=>@feature_votes.feature_title, :datetime=>Time.now)
			log.save()
    else
    	@msg = "DUPE"
    end
		

		

		
		#increase user karma

		
  	render :layout => false
  end
  


  def edit
    @feature_vote = FeatureVote.find(params[:id])
  end
  
  def update
    @feature_votes = FeatureVote.find(params[:id])
    if @feature_votes.update_attributes(params[:feature_votes])
      flash[:notice] = "Successfully updated feature votes."
      redirect_to @feature_votes
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @feature_votes = FeatureVote.find(params[:id])
    @feature_votes.destroy
    flash[:notice] = "Successfully destroyed feature votes."
    redirect_to feature_votes_url
  end
end
