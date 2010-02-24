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
			when "NEW_FEATURE_SOCIAL" then "added"

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

	  
end
