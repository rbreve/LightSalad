class TagsController < ApplicationController
	def index
		s=params[:search]
		s=s.split(" ")
		len=s.length()
		
		if len>1:
			search=s[len-1]
		else
			search=s
		end
		
		@tags = Tag.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	end
	
end