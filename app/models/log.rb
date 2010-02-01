class Log < ActiveRecord::Base
    belongs_to :user
    belongs_to :list
    belongs_to :feature
    belongs_to :comment
    
    def listtype()
      
    end
end
