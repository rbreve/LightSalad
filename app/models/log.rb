class Log < ActiveRecord::Base
    belongs_to :user
    belongs_to :list
    belongs_to :feature
    belongs_to :comment
    
 
    def listtype()
    end
		
		cattr_reader :per_page
 		@@per_page = 25
 
 end
