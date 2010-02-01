 

#require 'net/http'
#
#Net::HTTP.start("demos.icomstec.com") { |http|
#  resp = http.get("/icomstime/img/logo.gif")
#  open("logo.gif", "wb") { |file|
#    file.write(resp.body)
#   }
#}
#puts "Yay!!"
require "rubygems"
 require 'hpricot'
 require 'open-uri'
  require 'uri'
 
class Crawler


  def getimage(url)
          uri = URI.parse(url)
          Net::HTTP.start(uri.host) { |http|
            
             puts "Leeching Direct Image: #{url}"
           
             resp = http.get(url)
              open("dump/" + uri.path.delete("/"), "wb") { |file|
                  file.write(resp.body)
             }
           }
    
  end
  
  def crawl(url)
    url = url.gsub(/ /,'%20')
    url = url.gsub(/&amp;/,'&')
    uri  = URI.parse(url)
    domain = uri.host
    urlpath =  uri.path
    puts "Hpricoting [#{url}]"
    begin
      doc = Hpricot(open(url))
    rescue
      puts "Fucked Url"
      return false
    end
    doc.search("img").each do |para|
        imgpath = para.attributes['src']
        img_ext = imgpath[-3,3]
     
        if (img_ext == "jpg" or img_ext == "gif" or img_ext == "pnx")
              #Net::HTTP.start(domain) { |http|
             puts "Leeching image: #{domain}#{imgpath}"
             imgpath = urlpath + imgpath unless  imgpath[0..0] == "/" 
#             imgpath=imgpath.gsub(/%20/," ")
#             resp = http.get(imgpath)
#              open("dump/" + imgpath.delete("/"), "wb") { |file|
#                  file.write(resp.body)
#             }
#          }
      end
    end
  end
end


 c = Crawler.new
  
 #url = gets
 #url=url.chop
 
 url = "http://www.kindgirls.com/gal.php?dir=katarina_5236&nom=Katarina&num=16&pub=metart"
 url = "http://www.monoart.com/monoart/environmental_nudes1.html"
 url= "http://www.flickr.com/photos/breve/"
 #url = "http://store.apple.com/1-800-MY-APPLE/WebObjects/AppleStore.woa/wa/RSLID?nnmm=browse&mco=D2D493CA&node=home/macbook/macbook_pro"
 
 uri  = URI.parse(url)
domain = uri.host
# urlpath =  url.gsub(/(http:\/\/)[\w.]+/, '')
# urlpath =  urlpath.gsub(/[\w\.\?\=\d]+$/, '')
urlpath = uri.path 
 
doc = Hpricot(open(url)) 
puts "path is: " + urlpath + "\n" 
puts "domain is: #{domain} \n"
 
doc.search("img").each do |para|
  imgpath = para.attributes['src']
  img_ext = imgpath[-3,3]
 
  if (img_ext == "jpg" or img_ext == "gif" or img_ext == "pnx")
  
        if(imgpath[0..6]=="http://")
            imguri = URI.parse(imgpath)
            domain_img = imguri.host
            imgpath = imguri.path
        else
          domain_img = domain
          if imgpath[0..0] != "/" 
            imgpath = urlpath.gsub(/[\w\.\?\=\d]+$/, '')  + imgpath
          end
        end
        
         Net::HTTP.start(domain_img) { |http|
         
         
      puts "getting #{domain_img}#{imgpath}"
           resp = http.get(imgpath)
           open("dump/" + imgpath.delete("/"), "wb") { |file|
                file.write(resp.body)
          }
         }
  end
        
 end
 
(doc/"a").each do |links|
   link = links.attributes['href']
   
  
 
     if link[0..6] == "http:\/\/"
      #c.crawl(link)
     else
     
      #url is an image
      if link[-3,3] == "jpg" 
            link =  url  + link
           c.getimage(link)
      else
         link = url  + link
        puts "Crawling: #{link}"
        # c.crawl(link)
     end
 
 end
 
 end
 

 
