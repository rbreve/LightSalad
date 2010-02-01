class List < ActiveRecord::Base
   
  cattr_reader :per_page
  @@per_page = 10
  
  has_many :features
  belongs_to :user
  belongs_to :category
  has_many :logs
  
  validates_presence_of :name, :description
  
  acts_as_ferret :fields => [:name, :description, :listfeatures]
  
  
  def listfeatures
    myfeatures=Array.new
    for f in self.features
      myfeatures << f.title
      myfeatures << f.description
    end
    return myfeatures.join(" ")
  end
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def self.validates_captcha(*attr_names)
    attr_names.each do |attr_name|
      
    end
    
  end
  
  def type
    if listtype==0
      return "PUBLIC"
    elsif listtype==1
      return "FRIEND"
    elsif listtype == 2
      return "PRIVATE"
    end
  end
  
  def self.find_new(time, category_id=nil, page=1, user_id=0)
    if category_id != "All" and category_id != nil
      sql_category = "and category_id=#{category_id.to_i}"
    end
    
    if user_id != 0
        sql_user = "and user_id = #{user_id.to_i}"
    end
    
    if time == "updated"
      orderby = "lastupdate desc"
    elsif time == "created"
      orderby = "datetime desc"
    end
    
    List.paginate( :conditions=> "listtype='SOCIAL' #{sql_category} #{sql_user}", 
                              :include =>:user, 
                              :limit => 40,
                              :order => orderby,
                              :page => page)
  end
  
  def self.find_by_owner(user_id, category_id=nil, page=1)
    if category_id != nil
      sql_category = "and category_id=#{category_id}"
    end
    List.paginate( :conditions=> ["#{sql_category} user_id = ?", user_id], 
                              :include =>:user, 
                              :order => "datetime desc",
                              :page => page)
  end
  
  def self.find_all_popular(time, category_id=nil, page=1, user_id=nil) 
    if user_id 
          sql_user = "and user_id = #{user_id.to_i}"
    end
    
    if time == "week"
      mindate = Date.today.ago(60*60*24*7).strftime('%Y-%m-%d 23:59:59') #1 week ago
      sql_time = "and datetime > '#{mindate}'"
    elsif time == "month"
      mindate = Date.today.ago(60*60*24*30).strftime('%Y-%m-%d 23:59:59') #1 month ago
      sql_time = "and datetime > '#{mindate}'"
    elsif time == "year"
       mindate = Date.today.ago(60*60*24*30*12).strftime('%Y-%m-%d 23:59:59') #1 year ago
        sql_time = "and datetime > '#{mindate}'"
    end
    
    if category_id != "All" and category_id != nil
      sql_category = "and category_id=#{category_id.to_i}"
    end
      
    
    List.paginate( :conditions=> "listtype='SOCIAL' #{sql_category}  #{sql_time} #{sql_user}", 
                              :include =>[:user], 
                              :order => "points desc,  features_count desc, datetime desc",
                              :page => page)
  end
   
end
