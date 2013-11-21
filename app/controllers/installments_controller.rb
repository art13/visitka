# encoding: utf-8
class InstallmentsController < ApplicationController
	 skip_before_filter  :verify_authenticity_token
	 def create
	 	@installment=Installment.new
	 	@installment.license_key=params[:key]
	 	@installment.product_key=params[:programm_version]
	 	@installment.installer_version=params[:installer_version]
	 	@installment.info=params[:info]
	 	if @installment.save
	 		#@installment.reset_line
	 		@installment.swap_keys
	 		if @installment.swap?
	 			render text: '202'
		 		 # respond_to do |format|
		 		 # 	format.js { head 202}
		 		 # 	format.html { head 202}
		 		 # 	format.xml {head 202}
		 		 # end
		 	else
		 		render text: '417'
		 		# respond_to do |format|
		 		# 	format.js { head 417}
		 		# 	format.html { head 417}
		 		# 	format.xml {head 417}
		 		# end
	 		end
	 	else 
	 		render text: '400'
	 		# respond_to do |format|
		 	# 		format.js { head 400}
		 	# 		format.html { head 400}
		 	# 		format.xml {head 400}
		 	# end
	 	end	
	 end
	

	 
end
	