class MaterialsController < ApplicationController
	def index
		@materials_all = Material.all
		@materials = Kaminari.paginate_array(@materials_all).page(params[:page]).per(9)
		@clients = Client.first(6)
	end
	def show
		@material = Material.find(params[:id])
		
	end
end