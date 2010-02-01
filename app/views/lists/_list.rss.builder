xml.instruct!
  xml.rss "version" => "2.0" , "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
    xml.channel do
      xml.title @list.name
      xml.link  url_for(:only_path => false)
      xml.description @list.description
      
        @list.features.reverse.each do |feature| 
          xml.item do
            xml.title   feature.title  
            xml.link   url_for( :only_path => false, :controller => "comments", :feature_id => feature.id)
         end
    end
  
  end
end