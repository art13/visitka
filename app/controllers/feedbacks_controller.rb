class FeedbacksController <ApplicationController
	def create
		@flag=false
		@data=DataContact.first
		@feedback=Feedback.new(params[:feedback])
		if !@feedback.save
			flash["fdbck_errors"] = @feedback.errors.full_messages
		else
			FeedbackMailer.delay.message_email(@feedback, @data)
			@flag=true
			flash["fdbck_success"] = "Feedback was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end