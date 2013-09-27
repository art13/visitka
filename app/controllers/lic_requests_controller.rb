class LicRequestsController < ApplicationController
	def create
		@flag=false
		@lic_request=LicRequest.new(params[:lic_request])
		if !@lic_request.save
			flash["req_errors"] = @request.errors.full_messages
		else
			#FeedbackMailer.message_email(@feedback, @data).deliver
			@flag=true
			#flash["req_success"] = "request was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end