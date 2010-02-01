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
      f=Feature.find(params[:feature_id])
      @comment.feature_id=f.id
      @comment["datetime"] = Time.now
      @comment["user_id"] = session["person"].id	
      @comment["votes_count"]=0
      @comment["list_id"] = f.list_id
       
      @comment.save
      log(session["person"].id, "NEW_COMMENT", @comment.id, f.id)
      
      render(:layout => false)  
      
      
    end
end
