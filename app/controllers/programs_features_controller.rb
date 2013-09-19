class ProgramsFeaturesController < ApplicationController
	def index
	
	end
	def show
		@feats=ProgramsFeature.where("material_id=?",params[:id])
	end
end