class FeedbacksController <ApplicationController
	def create
		@flag=false
		@feedback=Feedback.new(params[:feedback])
		if !@feedback.save
			flash["fdbck_errors"] = @feedback.errors.full_messages
		else
			FeedbackMailer.message_email(@feedback).deliver
			@flag=true
			flash["fdbck_success"] = "Feedback was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end