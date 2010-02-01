require 'htmlentities'

class ListsController < ApplicationController
layout "salad"

  def index
    @html = HTMLEntities.new
    sort = params[:sort]
    
    if sort == "hot"
      sort_by = "points desc"
    elsif sort == "new"
      sort_by = "datetime desc"
    elsif sort == "updated"
      sort_by = "lastupdate desc"
    end
    
    
    @products =   List.paginate(:all, :conditions=> "listtype=0", :order => sort_by,:page => params[:page])

    @categories = Category.find(:all, :conditions => "category_id=0")
   
    respond_to do |format| 
      format.html # index.html.erb 
      format.xml { render :xml => @products } 
    end 

  end
  
  def show
    @product = Product.find(params[:id])
    

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @rumor }
     end
   end
  
  
  
  
  
end
