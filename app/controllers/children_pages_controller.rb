class ChildrenPagesController < ApplicationController
	def show
		@page=ChildrenPage.find(params[:id])
		
	end
end