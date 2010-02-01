module UserHelper

  def friend_image(image)
     if image ==""
       image = "noimage.png"
     end
     "<img  src=\"#{UPLOAD_PATH}" + image + "\" >"
   end
   
   

end
