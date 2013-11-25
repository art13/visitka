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
 		event :crypta do 
 			#transition :to => :download, :from =>[:swap], :do => :encrypting_files 
 		end

 		    #if states[:post_request]
 		    #	before_transition :from =>[:post_request], :do => :
 	         #end
	 	    if states[:swap]
	 	      	after_transition :from=> [:post_request], :do => :create_product_key
	 	      #	before_transition :to =>[:download_files],
	 	      #	after_transition :from=> [:post_request], :do => :encrypting_files
	 	    end
	 	#after_transition :to => :post_request, :do=> :reset_line    
	 	#after_transition :to =>[:swap], :do =>  :reset_line
	 	  
	end

	def checked_keys
		logger.debug('qwerty')
	end
	def keys_control?
	 	@key=LicKey.find_by_lic(self.license_key)
	    @key_status=0
	 	unless @key.nil?
		 	if @key.status=='Не активирован'
		 		@key.status='Активирован'
		 		@key.save
		 		self.status=1
		 		self.save
			    logger.debug('=======================')
				logger.debug('==== Key accepted =====')
				logger.debug('=======================')
		 		return true
			else
				#@number_all=Installment.where(:license_key=>@key.lic).
				@last_info=Installment.where(:license_key=>@key.lic).where(:state=>'swap').first
			 	logger.debug('==========================')
				logger.debug('=== Key already active ===')
				logger.debug('==========================')
				if self.info==@last_info.info
					self.status=2
					self.save
					logger.debug ('====================')
					logger.debug ('==== Info valid ====')
					logger.debug ('====================')
					return true
				else	
					self.status=3
					self.save
					logger.debug ('==================')
					logger.debug ('==== Info new ====')
					logger.debug ('==================')
			 		return false
			 	end 
			end 	 
		else
			logger.debug('=======================')
			logger.debug('==== Key not found ====')
			logger.debug('=======================')
			self.status=4
			self.save
			# logger.debug ('============================')
			# logger.debug ('==== Line was destroyed ====')
			# logger.debug ('============================')
				return false
		end      	                                      
	end
	def create_product_key
		@hash_key=Digest::SHA256.hexdigest(self.license_key)
		logger.debug(@hash_key)
		@hash_info=Digest::SHA256.hexdigest(self.info)
		logger.debug(@hash_info)
		@product_key=@hash_key+@hash_info
		self.product_key=@product_key
		self.save
		logger.debug('============================')
		logger.debug('==== create_product_key ====')
		logger.debug(self.product_key)
		logger.debug('============================')
	end
	# def encrypting_files
	# 	@file=Material.find_by_id(self.license_key.split('-').first.split('x').last).release.path
	# 	@path_file=Rails.root.to_s+'/public/system/files/'+@file.split('/').last+self.id.to_s
	# 	system "unzip #{@file} -d #{@path_file}" 
	# end
# 		def reset_line
# 				logger.debug ('============================')
# 				logger.debug ('==== Line was destroyed ====')
# 				logger.debug ('===== Key was deactive  ====')
# 				logger.debug ('============================')
# 		end
# 	 	handle_asynchronously :reset_line, :run_at => Proc.new { 2.minutes.from_now }
end

