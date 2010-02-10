ActionController::Routing::Routes.draw do |map|
  map.resources :logs, :as => "activity"

  map.resources :feature_votes
  map.resources :user_sessions

  map.login "login", :controller=>"user_sessions", :action=>"new"
  map.logout "logout", :controller=>"user_sessions", :action=>"destroy"
  map.resources :categories do |category|
    category.resources :lists 
  end
  
  map.resources :lists, 
    :collection => { :search => :get }, 
    :has_many => :features
  # map.resources :lists do |list|
  #   list.resources :features
  #   
  # end

	map.root :lists
	
 
	
	map.resources :users
	
  map.resources :features do |feature|
    feature.resources :comments
  end
  
  # 
  # map.resources :users, :collection =>{
  #                       :update_password => :post, 
  #                       :upload_picture => :get, 
  #                       :addtofriend => :get, 
  #                       :edit_profile=> :get, 
  #                       :update_profile => :post,
  #                       :crop_picture => :post,
  #                       :update_picture => :post},
  #                       :has_many => :lists
                        
  map.connect "edit_password", :controller => "users", :action => "edit_password"
  map.connect "update_password", :controller => "users", :action => "edit_password"
   
  map.tags "tags/:time/:category_id",
    :conditions => {:method => :get},
    :sortby => "tags",
    :controller => "lists",
    :action => "index",
    :category_id => nil
  
	map.sort "sort/:category_id/:sortby",
		 :conditions => {:method => :get},
     :time => nil,
     :controller => "lists",
     :action => "index"
   
	
  map.lista "lista/:category_id/:sortby/:time/:user_id",
     :conditions => {:method => :get},
     :time => nil,
     :user_id => nil,
     :controller => "lists",
     :action => "index"
     
     
     map.search "search/:q",
       :conditions => {:method => :get},
       :controller => "lists",
       :action => "search"

  #map.resources :lists

  # The priority is based upon order of creation: first created -> highest priority.
  #map.resource :openid, :member => { :complete => :get }
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '', :controller => "lists"
  
 
 # map.connect 'users/:id', :controller => 'user', :action => 'show'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
  
 #map.resources :lists, :collection => {:category => :get} 
      
  
end
