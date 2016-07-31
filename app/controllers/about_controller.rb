class AboutController < ApplicationController
	def index
		@data = DataContact.first	
	end
end