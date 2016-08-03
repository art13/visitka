class QuestionnairesController < ApplicationController
	def create
		@flag = 0
		@anketa = Questionnaire.new(params[:questionnaire])
		unless @anketa.save
			flag = 0
			flash["questi_errors"] = @anketa.errors.full_messages
		else
			@flag = 1
			flash["questi_success"] = "Anketa was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end