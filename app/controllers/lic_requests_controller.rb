# uncoding: utf-8
class LicRequestsController < ApplicationController
	def create
		@flag=false
		@user=current_user
		@lic_request=LicRequest.new(params[:lic_request])
		if !@lic_request.save
			flash["req_errors"] = @lic_request.errors.full_messages
		else
			@flag=true
		end
		respond_to do |format|
			format.js
		end
	end
	def request_programm
	end
end