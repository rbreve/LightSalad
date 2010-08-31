#LightSalad#

With LightSalad can create lists, add items to them rank them throught votes. 
You can use LightSalad as a Q&A system just like stackoverflow.

A running version is running at [LightSalad.com](http://lightsalad.com)

#Requirements#

LightSalad was developed on Rails 2.x, it uses Sphynx for search

Gems needed are

*   recaptcha
*   authlogic
*   oauth
*   mechanize
*   json"
*   authlogic-oauth

Captcha API keys

#Install#

*   Edit you environment.rb and add your captcha API public and private keys

*   Edit your environment/development.rb and add your smpt server configuration in order to send mails

*   rake db:schema:load  
    
*   rake db:seed
    
    

