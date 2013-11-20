# encoding: utf-8
class InstallmentsController < ApplicationController
	 def create
	 	@installment=Installment.new
	 	@installment.license_key=params[:key]
	 	@installment.material_id=params[:progr_version]
	 	@installment.installer_version=params[:installer_version]
	 	@installment.info=params[:info]
	 	if @installment.save
	 		#@installment.reset_line
	 		@installment.swap_keys
	 		#@installment.reset_line#.delay(run_at: 2.minutes.from_now).reset_line
	 		 respond_to do |format|
	 		 	format.js { head :ok}
	 		 end
	 	else
	 		respond_to do |format|
	 			format.js {head :bad_request}
	 		end
	 	end
	 end
	

	 
end
	