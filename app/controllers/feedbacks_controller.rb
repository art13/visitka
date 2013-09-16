class FeedbacksController <ApplicationController
	def create
		@feedback=Feedback.new(params[:feedback])
		if !@feedback.save
			flash["fdbck_errors"] = @feedback.errors.full_messages
		else
			flash["fdbck_success"] = "Feedback was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end