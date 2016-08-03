class ExpertsController < ApplicationController
	def index
		@experts = Expert.all
	end
	
	def show
		
	end
end