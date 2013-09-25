class PagesController < ApplicationController
	def index
		@pages=Page.find(:all)
		@news=Kaminari.paginate_array(@pages).page(params[:page]).per(10)	
	end
	def show
		@page=Page.find(params[:id])
	end
end