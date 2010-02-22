# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def p(text)
 		# text=auto_link(text)
 		# 	if text =~ /<a href=\"http:\/\/([\w\d\_\=\?\-\.\/\&\;\%]+)\"/
 		# 		domain=$1
 		# 	end
 		# 	if domain
 		# 		
 		# 	end
		text=auto_t(text)
		sanitize(text, :tags => %w(img a b), :attributes => %w(src href width))
	end
	
	
	def auto_t(text, html_options = {})
					are=%r{ ( https?:// | www\. ) [^\s<]+ }x  
					bra={ ']' => '[', ')' => '(', '}' => '{' }

          link_attributes = html_options.stringify_keys
          text.gsub(are) do
            href = $&
            punctuation = ''
            left, right = $`, $'
            # detect already linked URLs and URLs in the middle of a tag
            if left =~ /<[^>]+$/ && right =~ /^[^>]*>/
              # do not change string; URL is alreay linked
              href
            else
              # don't include trailing punctuation character as part of the URL
              if href.sub!(/[^\w\/-]$/, '') and punctuation = $& and opening = bra[punctuation]
                if href.scan(opening).size > href.scan(punctuation).size
                  href << punctuation
                  punctuation = ''
                end
              end

              link_text = block_given?? yield(href) : href
              href = 'http://' + href unless href.index('http') == 0
							ext=link_text[-3,3]
			 		
							if (ext =="jpg") or (ext=="png") or (ext=="gif") or (ext=="jpeg") 
								h="<a href=\""+link_text+"\"><img src=\"http://thumblerific.appspot.com/t?image_url=" + link_text + "&width=220\"></a>"
							else
              	content_tag(:a, h(link_text), link_attributes.merge('href' => href)) + punctuation
            	end
						end
          end
        end

  
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
