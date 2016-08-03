class ProgramsFeaturesController < ApplicationController
	def index
		@feats = Material.all
	end
	def show
		
	end
end