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
	
	def download_files_step
		if params[:confirm]
			params[:confirm]=params[:confirm].upcase
		    if params[:confirm]=='OK'&&!$request.nil?&&!$download_file.nil?#&&!$destroyed_path.nil?
			  logger.debug('============================')
			  logger.debug($request.license_key)
			  logger.debug('============================')
			  logger.debug($download_file)
			  logger.debug('============================')
			  logger.debug($destroyed_path)
			  logger.debug('============================')
			  @installment=Installment.find($request.id)
			  @installment.downloads
			    if @installment.download_files?
			  		#render text: 'download'
			  		send_file "#{$download_file}"
			  		system "rm -rf #{$path_file}"		
			    else
			   		render text: '200'
			   	end
			else
			   	render text: '406'
			end
		else
			render text: '400'
		end
		
	end
	def instalations_end
		@installment=Installment.find($request1.id)
		if @installment.download_files?&&params[:complete]
			params[:complete]=params[:complete].downcase
		    if params[:complete]=='yeap'&&!$request1.nil?
		    	@installment.endgame
		    	if @installment.instalation_complete?
		    		@installment.status='instalation_complete'
		    		@installment.save
		    		render text:'200'
		    	else
		    		render text:'400'
		    	end 
		    	
		    else
		    		@installment.status='instalation failure'
		    		@installment.save
		  	        render text: '406'
		    end
		else
			render text: '417'
		end
	end
end

	