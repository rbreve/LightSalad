class User < ActiveRecord::Base

has_many :lists
has_many :feature_votes
has_many :features, :through => :feature_votes
has_many :logs
has_many :friends, :foreign_key => "user_id"
has_many :comments

validates_format_of :lastname, :with =>/^ENSALADA$/, :message => "Invite Code Invalid"
validates_uniqueness_of :username, :case_sensitive => false
validates_format_of       :username, :with => /^[a-z]{2}(?:\w+)?$/i
validates_presence_of :name, :email, :password, :username
validates_uniqueness_of :email, :username
validates_confirmation_of :password, :message => "Passwords should match "

before_save   { |u| u.email.downcase! if u.email }


def self.authenticate(email, pass)
         find(:first,:conditions => [ "email = ? AND password =?", email, pass ])
    end

 
end
