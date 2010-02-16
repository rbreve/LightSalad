#require 'RMagick'
require 'htmlentities'
require 'mechanize'

class SaladController < ApplicationController


def index
   redirect_to  :action => 'list'
end


def search
  keyword = params[:keyword]
  sql=""
  words = keyword.split
  for word in words do
      if word.length > 3
        sql += "or name like '%#{word}%' "
      end
  end
  
  @lists = List.find(:all, :conditions => ["(name like ? or description like ?)and listtype='SOCIAL'", "%" + keyword + "%","%" + keyword + "%s"])
  
end



def searchall
  keyword = params[:id]
  @features=Feature.find(:all, :conditions => "title like '%#{keyword}%'")
end

def tags
  @html = HTMLEntities.new
  @tag = params[:id]
  @products=List.find(:all, :conditions => ["tags like ?", "%" + @tag + "%"])
end

def friends
  unless session["person"]
          redirect_to :controller=>'user',:action => 'signin'
		  return false
  end
  @products = List.find(:all, :conditions => "#{@fid}", :order => "points DESC")
  
end

def spy
    @pages, @logs = paginate_collection Log.find(:all, :order => "datetime DESC", :conditions => "action = 'NEW_FEATURE_PUBLIC' or action='NEW_LIST_PUBLIC' or action='VOTE_UP'" ), :per_page => 50
end

def create
end

def list
  @html = HTMLEntities.new
  type = params[:id]
  if type.to_s=="hot"
    sql = "points DESC"
  elsif type.to_s == "updated"

    sql = "products.lastupdate DESC"
  else  
    sql = "products.datetime DESC"

  end
  
  @categories = Category.find(:all, :conditions => "category_id = 0")
  
  @logs = Log.find(:all, :order => "datetime DESC", :limit=>5)
  @lists =   List.find(:all, :order =>  "datetime DESC", :conditions => "listtype=0") 
  @tops = List.find(:all, :order => "points DESC", :conditions => "listtype=0", :limit=>10)
   #, :include=>[:features, :user]
  
  if type=="my"
    @latests =  List.find(:all, :order => sql , :conditions => "listtype=2") 
  else
     
      @latests = List.paginate :page => params[:page]         
      #@latests =  List.find(:all, :order => sql , :conditions => "listtype=0") 
  end
   
  if(session[:person])
    user=User.find(session["person"].id)
    @fid = "1=2 "
    for f in user.friends
      @fid += " or user_id = #{f.friend_id} "
    end
    @friendlist = List.find(:all, :conditions => "#{@fid}", :order => "points DESC", :limit => 10)
  end
  
  @cloud = Tag.find(:all, :order => "n DESC", :conditions=>"n > 1",:limit => 10)
end

def view
  
  @view = params[:view]
  
  
  if @view != "all"
    points = "points >= -5"
  else
    points = "points > -20"
  end
  
  @html = HTMLEntities.new
  @product = List.find(params[:id])
  
  render :text => "List not found", :status => 404
  
  
  if @product.listtype == PRIVATE_LIST
    password = params[:password]
    if password != @product.password
      redirect_to :action => 'askpass', :id=>@product.id
    end
  end
  @features = @product.features.find(:all, :order => "points DESC, datetime DESC", :conditions => points)
end

def askpass
  @id = params[:id]
end

def captcha
  	 img = Magick::ImageList.new("public/images/captcha.png")
  	 gc = Magick::Draw.new
     gc.gravity = Magick::CenterGravity
     gc.pointsize = 29
     gc.text_antialias=false
   
     gc.font_family = "Helvetica"
     gc.font_weight = 100
     gc.stroke = 'none'
     gc.annotate(img, 0, 0, 0, 0,session['captcha'])
  	 img = img.implode(0.2)
  	
  	 img=img.wave(rand(10), 140+rand(10))
  	 headers["Content-Type" ] = "image/png"
  	 render :text => img.to_blob    
end


def rss
   @product = List.find(params[:id])
  @features = @product.features.find(:all, :order => "points DESC, datetime DESC")
  render :layout => false
  headers["Content-Type" ] = "application/rss+xml"
end


def whovoted
  @feature = Feature.find(params[:id], :conditions => "points > 0")
  #@liked = FeatureVotes.find(:conditions=>["points > 1 and feature_id = ?", @feature.id])
  @liked = User.find(:all, :joins => ", feature_votes", :conditions => "feature_votes.points = 1 and feature_votes.feature_id = #{@feature.id} and feature_votes.user_id = users.id", :limit=>20)
  @disliked = User.find(:all, :joins => ", feature_votes", :conditions => "feature_votes.points = -1 and feature_votes.feature_id = #{@feature.id} and feature_votes.user_id = users.id", :limit=>20)
  
  @product = List.find(@feature.list_id)
end

def report
  render :layout => false
end


def users
  user = params[:username]
  @html = HTMLEntities.new
  @user = User.find(:first, :conditions => ["username = ?", user])
  @comments = Comment.find(:all, :conditions => "user_id = #{@user.id}", :limit=>10)
  
  #	@candidates=Candidate.find(:all, :joins=>", users_votes", :conditions=>"round_id = #{ROUND} and candidates.id = users_votes.candidate_id and users_votes.user_id='#{session["person"].id}'", :group=>"candidate_id")
  
  
  @likes = FeatureVote.find(:all, :conditions => "user_id = #{@user.id} and value = 1", :limit=>20)
  @dislikes = FeatureVote.find(:all, :conditions => "user_id = #{@user.id} and value = 0", :limit=>20)
end

def dup_suggestion
   list_id=params[:id] 
   title = params[:title] 
   stitle = "%" + title + "%"
   @similar = Feature.find(:all, :conditions => ["list_id = ? and title like ?", list_id, stitle ])
   render(:layout => false)
end

def newitem
  unless session["person"]
    redirect_to :controller=>'user',:action => 'signin'
    return false
  end
  
  sure = params[:sure]
  @title = params[:title] 
  @description = params[:description]
  @list_id = params[:id]
  stitle = "%" + @title + "%"
  list = List.find(@list_id)
  @similar =  Feature.find(:all, :conditions => ["list_id = ? and title like ?", @list_id, stitle ])
  if @similar.empty? or sure 
    
    feature_id = add_feature(@list_id, @title, @description)
    
   #add_points(@list_id, 1)
    log(session["person"].id, "NEW_FEATURE_"+list.type, @list_id, feature_id )   
    redirect_to  :action => 'view', :id => @list_id
  
  end
end

def add_points(list_id, points)
  @p = List.find(list_id)
  @p.points += points
  @p.update
end

def add_feature(list_id, title, description)
   @f = Feature.new()
   @f.title = title
   @f.description = description
   @f.datetime = Time.now
   @f.user_id = session["person"].id 
   @f.list_id = list_id
   @f.save
   return @f.id
end

def vote
  unless current_user
          redirect_to :controller=>'user',:action => 'signin'
		  return false
  end
  
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
    list_id = @feature.list_id
    list=List.find(list_id)
    
    featurevote = FeatureVote.find(:first, :conditions=>["feature_id = ? and user_id = ?", feature_id, current_user.id])
   # featurevote=nil
   
    if featurevote == nil or list.listtype == "PERSONAL"
        
        @feature.points += points
        @feature.feature_votes_count+=1
        @feature.save
        
    
        featurevote = FeatureVote.new
        featurevote.user_id  = current_user.id
        featurevote.feature_id = params[:id]
        featurevote.datetime = Time.now
        featurevote.ip = ENV['REMOTE_HOST']
        featurevote.points = points
        featurevote.value = points
        featurevote.list_id= list_id
        featurevote.save
        
        list.lastupdate = Time.now
        list.points += points
        list.save
        
        
       # log(session["person"].id, action, list_id, feature_id)
        
        @msg = "VOTED"
        
    else
      @msg = "DUPE"
    end
  end
  render :layout => false
  
end

def addtofriends
  unless session["person"]
          redirect_to :controller=>'user',:action => 'signin'
		  return false
  end
  f=Friend.new
  f.user_id = session["person"].id
  f.friend_id = params[:id]
  f.save
  redirect_to :controller => "users", :action=>session["person"].username
end


def comments
   @feature = Feature.find(params[:id])
   @product = List.find(@feature.list_id)
   @comments = Comment.find(:all, :conditions => "feature_id = #{@feature.id}")
end


def post_comment

  unless @session["person"]
    redirect_to :controller=>'user',:action => 'signin'
    return false
  end
  f = Feature.find(params[:id])
  comment = params[:comment]
  comment["datetime"] = Time.now
  comment["user_id"] = @session["person"].id	
  comment["feature_id"] = params[:id]	
  comment["votes_count"]=0
  comment["list_id"] = f.list_id
  @comment=Comment.create(comment)
  render(:layout => false)  
end

def invite
end

def gmail
  @emails = Array.new
  agent = WWW::Mechanize.new
  h =  HTMLEntities.new
  agent.user_agent_alias = 'Mac Safari'
  page = agent.get("http://mail.google.com/mail?ui=html&amp;zy=l")

  form = page.forms.first
   form.Email = params[:email]
   form.Passwd = params[:password]
  page = agent.submit(form)
  #puts page.root

  page = agent.get h.decode(page.search("//meta").first.attributes['content'][8..-2]) 
  page = agent.get("http://mail.google.com/mail?ui=html&amp;zy=l")
  page = agent.get("http://mail.google.com/mail/h//?v=cl&pnl=a")
  table=page.search("//table[@bgcolor='#ffffff']") 
  table.search("/tr/td").each do |t|
      st=t.inner_text.split[0].to_s
      if(st.index('@'))
       @emails << st
      end
  end
end

end
