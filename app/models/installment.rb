# encoding: utf-8
class Installment < ActiveRecord::Base 
	attr_accessible :product_key,:installer_version, :info, :license_key, :user_id, :user, :material_id, :material, :statement, :status, :state
 	 validates :info, :license_key, :presence => true
 	state_machine :initial => :post_request do 
 		state :post_request
 		state :swap
 		state :download_files
 		state :instalation_complete

 		event :swap_keys do 
 			transition :to => :swap, :from =>[:post_request], :if => :keys_control?
 		end
 		event :downloads do 
 			transition :to => :download_files, :from =>[:swap], :if => :castle_rock? 
 		end
 		event :endgame do 
 			transition :to => :instalation_complete, :from=>[:download_files]
 		end

	 	    if states[:swap]
	 	      	after_transition :from=> [:post_request], :do => :create_product_key
	 	      	after_transition :from=> [:post_request], :do => :encrypting_files
	 	    end
	end

	def keys_control?
	 	@key=LicKey.find_by_lic(self.license_key)
	 	unless @key.nil?
		 	if @key.status=='Не активирован'
		 		@key.status='В процессе'
		 		@key.save
		 		self.status=1
		 		self.save
			 #    logger.debug('=======================')
				# logger.debug('==== Key accepted =====')
				# logger.debug('=======================')
		 		return true
			else
				if @key.status=='Активирован'
  	            	# logger.debug('-----------active key-------------')
  	            	@active_k=Installment.where(:license_key=>@key.lic).where('state!=?','instalation_complete').first
  	            	if self.info==@active_key.info
  	            		self.status=2
						self.save
						# logger.debug ('====================')
						# logger.debug ('==== Info valid ====')
						# logger.debug ('====================')
						return true
					else	
						self.status=3
						self.save
						# logger.debug ('==================')
						# logger.debug ('==== Info new ====')
						# logger.debug ('==================')
				 		return false
				 	end 
				else
					@last_info=Installment.where(:license_key=>@key.lic).where('state!=?','post_request').first
				 # 	logger.debug('==========================')
					# logger.debug('=== Key already active ===')
					# logger.debug('==========================')
					if self.info==@last_info.info
						self.status=2
						self.save
						# logger.debug ('====================')
						# logger.debug ('==== Info valid ====')
						# logger.debug ('====================')
						return true
					else	
						self.status=3
						self.save
						# logger.debug ('==================')
						# logger.debug ('==== Info new ====')
						# logger.debug ('==================')
				 		return false
				 	end 
				end
			end 	 
		else
			# logger.debug('=======================')
			# logger.debug('==== Key not found ====')
			# logger.debug('=======================')
			self.status=4
			self.save
				return false
		end      	                                      
	end
	def create_product_key
		@hash_key=Digest::SHA256.hexdigest(self.license_key)
		# logger.debug(@hash_key)
		@hash_info=Digest::SHA256.hexdigest(self.info)
		# logger.debug(@hash_info)
		@product_key=@hash_key+@hash_info
		self.product_key=@product_key
		self.save
		# logger.debug('============================')
		# logger.debug('==== create_product_key ====')
		# logger.debug(self.product_key)
		# logger.debug('============================')
	end
	def encrypting_files
		@file=Material.find_by_id(self.license_key.split('-').first.split('x').last)
		@file_url=@file.release.path
		# logger.debug(@file_url)
		@folder_name=@file.release_file_name.split('.')
		@folder=@folder_name.first
		@path_file=Rails.root.to_s+'/public/system/files/'+@file_url.split('/').last+self.id.to_s
		system "unzip #{@file.release.path} -d #{@path_file}" 
		@db_file=Dir.glob(@path_file+"/#{@folder}/*.db").first
		system "openssl aes-256-cbc -in  #{@db_file} -out #{@db_file}.enc -pass pass:#{self.product_key.first(64)}"
		system "rm #{@db_file}"
		system "zip -r -j #{@path_file}/#{@folder}.zip  #{@path_file}/#{@folder}"
		system "rm -rf #{@path_file}/#{@folder}"
		@download_file=@path_file+'/'+@folder+'.zip'
		# logger.debug(@download_file)
	end
	def castle_rock?
		if self.swap?
			# logger.debug('=-----------------------==========================')
			# logger.debug(self.state)
			# logger.debug('=========================------------------------=')
			#$request1=self
			return true
		else
			# logger.debug(self.state)
			return false
		end	
	end

end

#openssl aes-256-cbc -d -in /home/art/11.db.enc -out /home/art/11.db -pass pass:'@key'