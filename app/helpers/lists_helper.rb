module ListsHelper

 

  def link_tags(text)
    tags = Array.new
    tags = text.split
    links = ""
    for tag in tags do
      links += "<a href=\"/tag/#{tag}\">#{tag}</a> "
    end
    links
  end
  
end
