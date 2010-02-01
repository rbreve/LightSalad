# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end
  #Categories Navigation
  def categories_nav(categories, current_id)
    
    current="current" if current_id==0
    
    html="<li class=\"#{current}\"><a href=/lists>All</a></li>"
    
    for category in categories
      if category.id==current_id
          current = "current" 
      else 
        current=""
      end
      
      html+="<li class=\"#{current}\"> <a href=\"/categories/#{category.id}/lists\">#{category.title}</a></li>"
    end
    
    html="
          <ul>
            #{html}
          </ul>
          "
    end
end
