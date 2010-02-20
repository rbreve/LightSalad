module LogsHelper
	
	
   def friend_image(image)
     if image ==""
       image = "noimage.png"
     end
     "<img  src=\"#{UPLOAD_PATH}" + image + "\" >"
   end

	def logaction(action)
		acttype = case  action
			when "VOTE_UP" then   "liked this"
			when "VOTE_DOWN" then "hated this"
			when "NEW_COMMENT" then "commented on"
			when "NEW_LIST_SOCIAL" then "created a new list"
		end
 	end

	def logicon(action)
		acttype = case  action
			when "VOTE_UP" then   "voteup.png"
			when "VOTE_DOWN" then "votedown.png"
			when "NEW_COMMENT" then "comment_icon.png"
			when "NEW_LIST_SOCIAL" then "list_icon.png"
			when "NEW_FEATURE_SOCIAL" then "icon-item.gif"
		end
	end

	 def activity(log)
   #borrar esto
     # return if ((log.action == "NEW_LIST_FRIENDS") or (log.action ==  "NEW_LIST_PERSONAL") or (log.action == "NEW_LIST_PRIVATE"))
      
      description=""
 
   		info=""
			date= time_ago_in_words(log.datetime) + " ago"
      if log.action == "NEW_FEATURE_SOCIAL" 
        icon = "icon-item.gif"
        title = "<a href=/features/#{log.feature_id}/comments>#{h(log.feature_title)}</a> in <a href=#{list_path(log.list_id)}>#{h(log.list_title)}</a>"
        info = "created this" + info
      elsif log.action == "VOTE_UP"
        icon = "voteup.png"
        title = "<a href=/features/#{log.feature_id}/comments>#{h(log.feature_title)}</a> in <a href=#{list_path(log.list_id)}>#{h(log.list_title)}</a>"
        info = "liked" + info
      elsif log.action == "VOTE_DOWN"  
        icon = "votedown.png"
        title = "<a href=/features/#{log.feature_id}/comments>#{h(log.feature_title)}</a> in <a href=#{list_path(log.list_id)}>#{h(log.list_title)}</a>"
        info = "hated this " + info
      elsif log.action == "NEW_COMMENT"
        icon = "comment_icon.png"
        title = "#{h(log.feature_title)} in #{h(log.list_title)} "
         info = "Commented " + info
      elsif log.action == "NEW_LIST_SOCIAL" or log.action == "NEW_LIST_PERSONAL"
        icon = "list_icon.png"
        title = "<a href=/lists/#{log.list_id}>#{h(log.list_title)}</a>"
        info = "created a new list " + info
        description = ""
      end
      
      render :partial => 'activity', :locals => {:title => title, :icon => icon, :info => info, :user => log.user, :date=>date}
         
   end
end
