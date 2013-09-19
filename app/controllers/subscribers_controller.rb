class SubscribersController < ApplicationController
	def create
		@flag=false
		@subscriber=Subscriber.new(params[:subscriber])
		if !@subscriber.save
				flash["sub_errors"] = @subscriber.errors.full_messages
		else
				@flag=true
		end
		respond_to do |format|
			format.js
		end
	end
end