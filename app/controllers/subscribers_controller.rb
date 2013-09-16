class SubscribersController < ApplicationController
	def create
		@subscriber=Subscriber.new(params[:subscriber])
		if !@subscriber.save
				flash["sub_errors"] = @subscriber.errors.full_messages
		else
				flash["sub_success"] = "Subscriber was saved"
		end
		respond_to do |format|
			format.js
		end
	end
end