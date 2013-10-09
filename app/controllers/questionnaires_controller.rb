class QuestionnairesController < ApplicationController
	def create
		@flag=false
		@anketa=Questionnaire.new(params[:questionnaire])
		if !@anketa.save
			flash["questi_errors"] = @anketa.errors.full_messages
		else
			#FeedbackMailer.message_email(@anketa, @data).deliver
			@flag=true
			flash["questi_success"] = "Anketa was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end