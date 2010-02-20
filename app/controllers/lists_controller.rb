class ListsController < ApplicationController

 

	before_filter :require_user, :only => [:create, :new, :vote]
	before_filter :adjust_format_for_iphone

  layout "lightsalad"
  before_filter :load_categories
  
  def tags
    @tag = params[:id]
    @lists=List.find(:all, :conditions => ["tags like ?", "%" + @tag + "%"])
  end
  
  def search
    q=params[:q]
    @lists=List.search q
  end

  def index
   
    @sort = params[:sortby] == nil ?  "hot" : params[:sortby]
    category_id = params[:category_id]
    keyword = params[:keyword]
    @time = params[:time]
    page = params[:page]
    user_id = params[:user_id]
   
    if category_id.to_i != 0 #A category is selected
      @sub_categories = Category.find(:all, :conditions=>["category_id=?",category_id])
      @current_category = Category.find(category_id)  
      @current_category_id = @current_category.id
      @tags = Tag.find(:all, :conditions=>["category_id=?",@current_category_id], :order => "n DESC", :limit=>8)
    else
      @current_category="All"
      @current_category_id=0
    end
    
     if @sort == "hot"
        @lists = List.find_all_popular(@time, category_id, page, user_id)
      elsif @sort == "new"
        @lists = List.find_new(@time, category_id, page)
      elsif @sort == "tags"
        @lists  = List.paginate(:all, :order=>"points desc",  :conditions => ["tags like ? and listtype='SOCIAL'", "%" + @time + "%" ], :page=>page)
      elsif @sort == "mine" and current_user != nil
        @lists = List.find_by_owner(current_user.id, category_id, page)
      else
        @lists = List.find_all_popular("month", category_id, user_id)
      end
    
    @cloud = Tag.find(:all, :order => "n DESC", :conditions=>"n > 1",:limit => 10)
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lists }
      format.iphone {  }
      
    end
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    password = params[:password]
    @sortby = params[:sortby]
    @sortby = "popular" if @sortby == nil
    sortby = (@sortby == "new" ? "datetime desc" : "points desc, datetime desc" )
    
     
    @categories = Category.find(:all, :conditions=>"category_id=0")

    @list = List.find(params[:id])
    @list.views_count += 1
    @list.save
    
    #fix este if simplificado
    if @list.listtype == "FRIENDS" and password != @list.password and @list.user_id != current_user.id
      redirect_to :action => "askpass", :id => @list
      return
    end

    @sub_categories = Category.find(:all, :conditions=>["category_id=?",@list.category_id])
    @current_category = Category.find(@list.category_id)
    @current_category_id = @current_category.id
    
    @tags = Tag.find(:all, :conditions=>["category_id=?",@current_category_id], :order => "n DESC", :limit=>8)
    
    
    @features = Feature.find(:all,:include => :user, :order => sortby  , :conditions => ["list_id=?",@list.id])
    @newfeature=Feature.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @features }
      format.rss { render :partial => 'list', :object => @list}
      format.iphone { render :layout => false }
      
    end
  end
  
  


  def askpass
    @list = List.find(:first)
  end

 
  def new
		# if not current_user
		# 	redirect_to login_path
		# end
		
		#verificar el category_id
		
		category_id=params[:category_id]
		
    @list = List.new
		@list.category_id=category_id
    
# chars = ("a".."e").to_a + ("1".."2").to_a 
    #  random = Array.new(5, '').collect{chars[rand(chars.size)]}.join
    #  session["captcha"] = random.to_s
  end

 
  def edit
    @list = List.find(params[:id])
  end
 
  def create
    @list = List.new(params[:list])
    @list.datetime = Time.now
    @list.status_id = 1
    @list.user_id = current_user.id
    @list.lastupdate = Time.now
    
    if verify_recaptcha() and @list.save
      tags=params[:list][:tags]
			tags=tags.gsub(/[,]/,' ')
			tags=tags.gsub(/[\s]+/, ' ')
			tags=tags.gsub(/^[a-zA-Z1-9\s]/, '')
      addtags(tags, params[:list][:category_id]) if params[:list][:listtype] == "SOCIAL"
      action= "NEW_LIST_" + params[:list][:listtype]
      #log(current_user.id, "NEW_LIST_" + params[:list][:listtype], @list.id, 0)
      log = Log.new(:action=>action, :user_id=>current_user.id, :list_id=>@list.id, :list_title=>@list.name, :datetime=>Time.now)
			log.save()

      flash[:notice] = 'List was successfully created.'
      redirect_to :action => "show", :id => @list
    else
      render :action => "new" and return
    end

  end

 
  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        flash[:notice] = 'List was successfully updated.'
        format.html { redirect_to(@list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(lists_url) }
      format.xml  { head :ok }
    end
  end
  
  def vote
    feature_id = params[:id]
    vote = params[:vote]

    if(vote=="up")
      action="VOTE_UP"
      points = 1
    else
      action="VOTE_DOWN"
      points=-1
    end

    @feature = Feature.find(feature_id)

    if @feature!=nil

      featurevote = FeatureVote.find(:first, :conditions=>["feature_id = ? and user_id = ?", feature_id, current_user.id])
     # featurevote=nil
      if featurevote == nil

          @feature.points += points
          @feature.feature_votes_count+=1
          @feature.save

          list_id = @feature.list_id

          featurevote = FeatureVote.new
          featurevote.user_id  = current_user.id
          featurevote.feature_id = params[:id]
          featurevote.datetime = Time.now
          featurevote.ip = ENV['REMOTE_HOST']
          featurevote.points = points
          featurevote.value = points
          featurevote.list_id= list_id
          featurevote.save

          list=List.find(list_id)
          list.lastupdate = Time.now
          list.points += points
          list.save


          log(current_user.id, action, list_id, feature_id)

          @msg = "VOTED"

      else
        @msg = "DUPE"
      end
    end
    render :layout => false

  end
  
  
  private
  

  
 
     
  def addtags(ptags, category_id)
     tags =  ptags.split
  	 for tag in tags do
  	   mytag  = Tag.find(:all, :conditions => ["name = ? and category_id = ?", tag, category_id])
  	   if mytag.empty?
  	     newtag = Tag.new
  	     newtag.name = tag
  	     newtag.n= 1
  	     newtag.category_id = category_id
  	     newtag.save
	     else
	      mytag = Tag.find(:first, :conditions => ["name = ?", tag])
	      mytag.n = mytag.n + 1
	      mytag.save
	     end
	   end
  end
end
