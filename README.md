#LightSalad#

With LightSalad you can create lists, add items to them rank them throught votes. 
You can use LightSalad as a Q&A system just like Stack Overflow but much simpler.

A demo version of LightSalad is running here at [LightSalad.com](http://lightsalad.com)

I started this project 2 years ago in order to learn Rails, so
you might encounter some weird stuff. Some controllers are not used, I dont use  REST all the time.
But overall the app works ok.
Feel free to clone, test, change the code or send me bugs and feedback.

#Requirements#

LightSalad was developed on Rails 2

Gems needed are

*   authlogic
*   oauth
*   mechanize
*   json"
*   authlogic-oauth
*   recaptcha (optional)


#Install#

*   Edit your environment/development.rb and add your smtp server configuration in order to send mails

*   rake db:schema:load  
    
*   rake db:seed
    
#Optional#

To use recaptcha:

*   Edit your environment.rb set USE_RECAPTCHA = true
*   Edit your environment.rb and add your captcha API public and private keys
 
#Important Views#
Main Layout view
    app/views/layouts/lightsalad.html.erb
Main page view
    app/views/lists/index.html.erb
Create new list view
    app/views/lists/new.html.erb
View a list view
    app/views/lists/show.html.erb
    
#Main Styles#
    public/stylesheets/main.css
    public/stylesheets/list.css