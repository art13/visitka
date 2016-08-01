class PagesController < ApplicationController
	def show
		@pages = Page.all
		@page = Page.find(params[:id])
	end
end