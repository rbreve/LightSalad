module SaladHelper

  def icon(value)

    if value 
      img = "<img src=/images/voteup.png>"

    else
      img = "<img src=/images/votedown.png>"
    end 

  end


  def link_words(text)
    texts =   Array.new
    texts = text.split
    links=""
    for word in texts do
      #remove short words 
      if word != "for" and word != "and" and word != "the" and word.length > 2 and word != "with"
        links += "<a href=\"/salad/searchall/#{word}\">#{word}</a> " 
      end
    end
    links
  end

  def link_tags(text)
    tags = Array.new
    tags = text.split
    links = ""
    for tag in tags do
      links += "<a href=\"/tags/#{tag}\">#{tag}</a> "
    end
    links
  end
  
  def voteicon(value)
    if value==1
        "<img alt=\"up\" src=\"/images/voteup.png\">"
    else
      "<img alt=\"down\" src=\"/images/votedown.png\">"
    end
  end

  def value_vote(user_id, feature_id)
    fv = FeatureVote.find(:first, :conditions=>["user_id = ? and feature_id = ?", user_id, feature_id])
    if fv.value
      "<img alt=\"up\" src=\"/images/voteup.png\">"
    else
        "<img alt=\"down\" src=\"/images/votedown.png\">"
    end
  end
  
  def friend_image(image)
    if image ==""
      image = "noimage.png"
    end
    "<img src=\"#{UPLOAD_PATH}" + image + "\">"
  end
  
  def listtype(t)
    if t==1 
        "private"
    else
        "public"
    end
    
  end

end



