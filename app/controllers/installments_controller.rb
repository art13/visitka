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
		if params[:sysha]
			@installment=Installment.where(:state=>'swap').where(:license_key=>params[:sysha].downcase).last
			if params[:confirm]&&!@installment.nil?
				@file=Material.find_by_id(@installment.license_key.split('-').first.split('x').last)
			 	@file_url=@file.release.path
			    @path_file=Rails.root.to_s+'/public/system/files/'+@file_url.split('/').last+@installment.id.to_s
			    if params[:confirm].upcase=='OK'
				    @installment.downloads
				    if @installment.download_files?
							logger.debug(@file_url)
							@folder_name=@file.release_file_name.split('.')
							@folder=@folder_name.first		
							@download_file=@path_file+'/'+@folder+'.zip'
				  		    send_file "#{@download_file}"
				    else
				    	
				   		render text: '202'
				   	end
				else
					
				   	render text: '406'
				end
			else
				render text: '400'
			end
		else
			render text: '400'
		end
		
	end
	def instalations_end
		if params[:sysha]
			@installment=Installment.where(:state=>'download_files').where(:license_key=>params[:sysha].downcase).last
			if params[:complete]&&!@installment.nil?
				@file=Material.find_by_id(@installment.license_key.split('-').first.split('x').last)
			 	@file_url=@file.release.path
				@path_file=Rails.root.to_s+'/public/system/files/'+@file_url.split('/').last+@installment.id.to_s
				logger.debug('------------')
				logger.debug(@installment.id)
				logger.debug('------------')
				if @installment.download_files?
				    if params[:complete].downcase=='yeap'
				    	@installment.endgame
				    	if @installment.instalation_complete?
				    		@installment.status='instalation_complete'
				    		@installment.save
							logger.debug(@file_url)
							@folder_name=@file.release_file_name.split('.')
							@folder=@folder_name.first
				    		system "rm -rf #{@path_file}"
				    		@key=LicKey.find_by_lic(@installment.license_key)
				    		@key.status='Активирован'
				    		@key.save
				    		render text:'200'
				    	else
				    		
				    		render text:'505'
				    	end 
				    	
				    else
				    		@installment.status='instalation failure'
				    		@installment.save
				  	        render text: '406'
				    end
				else
					render text:'202' 
				end
			else
				render text: '400'
			end
		else
			render text: '400'
		end
	end
end

	