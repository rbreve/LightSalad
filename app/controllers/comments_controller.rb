class CommentsController < ApplicationController
layout "lightsalad"
 before_filter :load_categories
 before_filter :adjust_format_for_iphone
 

    def index
      @feature = Feature.find(params[:feature_id])
      @product = List.find(@feature.list_id)
      @comments = Comment.find(:all, :conditions => "feature_id = #{@feature.id}")    
      @comment=Comment.new  
      respond_to do |format|
         format.html # show.html.erb
 
         format.iphone { render :layout => false }

       end
      
    end
    
 

    def create
      
      #verificar si esta logged
      
      @comment=Comment.new(params[:comment])
			@comment.feature_id
      f=Feature.find(params[:feature_id])
			list=f.list
      @comment.feature_id=f.id
      @comment["datetime"] = Time.now
      @comment["user_id"] =current_user.id	
      @comment["votes_count"]=0
      @comment["list_id"] = list.id
      @comment.save
      #log(current_user.id, "NEW_COMMENT", @comment.id, f.id)
      
			log = Log.new(:action=>"NEW_COMMENT", :user_id=>current_user.id, :list_id=>list.id, :list_title=>list.name, :datetime=>Time.now, :text=>"")
			log.save()
      
			render(:layout => false)  
      
      
    end
end
