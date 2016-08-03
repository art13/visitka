# encoding: utf-8
class InstallmentsController < ApplicationController
	 skip_before_filter  :verify_authenticity_token
	def create
	 	@installment=Installment.new
	 	if params[:key]
			params[:key]=params[:key].downcase
	 	end
	 	@installment.update_attributes(:license_key => params[:key], :material_id => params[:programm_version],
	 		:installer_version => params[:installer_version], :info => params[:info])
	 	if @installment.save
	 		@installment.swap_keys
	 		if @installment.swap?
	 			render text: '200'
	 		else
		 		render text: '417 'if @installment.status == 3
		 		render text: '404' if @installment.status == 4
	 		end
	 	else 
	 		render text: '400'
	 	end	
	end	
	
	def download_files_step

		if params[:sysha]
			@installment = Installment.where(:state => 'swap').where(:license_key => params[:sysha].downcase).last
			if params[:confirm] && !@installment.nil?
				@file = Material.find_by_id(@installment.license_key.split('-').first.split('x').last)
			 	@file_url = @file.release.path
			    @path_file = File.join(Rails.root.to_s, '/public', 'system', 'files', @file_url.split('/').last, @installment.id.to_s)
			    if params[:confirm].upcase == 'OK'
				    @installment.downloads
				    if @installment.download_files?
							@folder_name = @file.release_file_name.split('.')
							@folder = @folder_name.first		
							@download_file = File.join(@path_file, @folder)+'.zip'
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
			@installment = Installment.where(:state => 'download_files').where(:license_key => params[:sysha].downcase).last
			if params[:complete] && !@installment.nil?
				@file = Material.find_by_id(@installment.license_key.split('-').first.split('x').last)
			 	@file_url = @file.release.path
				@path_file = File.join(Rails.root.to_s, '/public', 'system', 'files', @file_url.split('/').last, @installment.id.to_s)
				if @installment.download_files?
				    if params[:complete].downcase == 'yeap'
				    	@installment.endgame
				    	if @installment.instalation_complete?
				    		@installment.status = 'instalation_complete'
				    		@installment.save
							logger.debug(@file_url)
							@folder_name = @file.release_file_name.split('.')
							@folder = @folder_name.first
				    		system "rm -rf #{@path_file}"
				    		@key = LicKey.find_by_lic(@installment.license_key)
				    		@key.update_attributes(:status => 'Активирован')
				    		render text:'200'
				    	else
				    		
				    		render text:'505'
				    	end 
				    	
				    else
				    		@installment.status = 'instalation failure'
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

	