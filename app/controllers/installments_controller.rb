# encoding: utf-8
class InstallmentsController < ApplicationController
	 skip_before_filter  :verify_authenticity_token
	def create
	 	@installment=Installment.new
	 	if params[:key]
			params[:key]=params[:key].downcase
	 	end
	 	@installment.license_key=params[:key]
	 	@installment.material_id=params[:programm_version]
	 	@installment.installer_version=params[:installer_version]
	 	@installment.info=params[:info]
	 	if @installment.save
	 		#@installment.reset_line
	 		@installment.swap_keys
	 		if @installment.swap?
	 			render text: '200'
	 		else
		 		 if @installment.status==3
		 			render text: '417'
		 		 end
		 		 if @installment.status==4
		 		 	render text: '404'
		 		 end	
	 		end
	 	else 
	 		render text: '400'
	 	end	
	end	
	def castle_rock
	  	
	end 
end
#Digest::MD5.hexdigest(x)  
	