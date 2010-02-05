module UsersHelper
  
  
  def friend_image(image)
       
      "<img   src=\"#{UPLOAD_PATH}" + image + "\">"
  end
  
  def activity(log)
      
     # return if ((log.action == "NEW_LIST_FRIENDS") or (log.action ==  "NEW_LIST_PERSONAL") or (log.action == "NEW_LIST_PRIVATE"))
      
      description=""
      info =  " " + time_ago_in_words(log.datetime) + " ago"
   
      if log.action == "NEW_FEATURE_SOCIAL" 
        icon = "icon-item.gif"
        title = "<a href=/features/#{log.feature.id}/comments>#{h(log.feature.title)}</a> in <a href=#{list_path(log.list_id)}>#{h(log.list.name)}</a>"
        info = "created this" + info
      elsif log.action == "VOTE_UP"
        icon = "voteup.png"
        title = "<a href=/features/#{log.feature.id}/comments>#{h(log.feature.title)}</a> in <a href=#{list_path(log.list_id)}>#{h(log.list.name)}</a>"
        info = "liked this" + info
      elsif log.action == "VOTE_DOWN"  
        icon = "votedown.png"
        title = "<a href=/features/#{log.feature.id}/comments>#{h(log.feature.title)}</a> in <a href=#{list_path(log.list_id)}>#{h(log.list.name)}</a>"
        info = "hated this " + info
      elsif log.action == "NEW_COMMENT"
        icon = "comment_icon.png"
        title = "#{h(log.feature.title)} in #{h(log.list.name)} "
         info = "Commented " + info
      elsif log.action == "NEW_LIST_SOCIAL" or log.action == "NEW_LIST_PERSONAL"
        icon = "list_icon.png"
        title = "<a href=/lists/#{log.list_id}>#{h(log.list.name)}</a>"
        info = "created a new list " + info
        description = "#{h(log.list.description)}"
      end
      
      render :partial => 'activity', :locals => {:title => title, :icon => icon, :description => description, :info => info, :user => log.user}
         
   end
end

