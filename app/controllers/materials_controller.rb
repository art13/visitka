class MaterialsController < ApplicationController
	def index
		@materials_all=Material.all
		@materials=Kaminari.paginate_array(@materials_all).page(params[:page]).per(9)
	end
	def show
		@material=Material.find(params[:id])
		
	end
end