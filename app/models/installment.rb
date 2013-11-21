# encoding: utf-8
class Installment < ActiveRecord::Base 
	attr_accessible :product_key,:installer_version, :info, :license_key, :user_id, :user, :material_id, :material, :statement, :status, :state
 	 #validates :info, :presence => true
 	state_machine :initial => :post_request do 
 		state :post_request
 		state :swap
 		state :download

 		event :swap_keys do 
 			transition :to => :swap, :from =>[:post_request], :if => :keys_control?
 		end
 		event :alles do 
 			transition :to => :download, :from =>[:swap]
 		end

 		   # if states[:post_request]
 		   # 	before_transition :from =>[:post_request], :do => :reset_line
 	       #  end
	 	   #  if states[:swap]
	 	   #   	after_transition :from=> [:post_request], :do =>:reset_line
	 	   #  end
	 	#after_transition :to => :post_request, :do=> :reset_line    
	 	#after_transition :to =>[:swap], :do =>  :reset_line
	 	  
	end

	def checked_keys
		logger.debug('qwerty')
	end
	def keys_control?
	 	@key=LicKey.find_by_lic(self.license_key)
	 	unless @key.nil?
		 	if @key.status=='Не активирован'
		 		@key.status='Активирован'
		 		@key.save
		    logger.debug('=======================')
			logger.debug('==== Key accepted =====')
			logger.debug('=======================')
		 		return true
		 	else
		 	logger.debug('==========================')
			logger.debug('=== Key already active ===')
			logger.debug('==========================')
			self.destroy
			logger.debug ('============================')
			logger.debug ('==== Line was destroyed ====')
			logger.debug ('============================')
		 		return false
		 	end  
		else
			logger.debug('=======================')
			logger.debug('==== Key not found ====')
			logger.debug('=======================')
			self.destroy
			logger.debug ('============================')
			logger.debug ('==== Line was destroyed ====')
			logger.debug ('============================')
				return false
		end     
	 	                                       
	end
	def reset_lines

		# if (Time.now>self.updated_at+2.minutes && self.post_request==true)
		# 	@key=LicKey.find_by_lic(self.license_key)
		# 	@key.status='Активирован'
		#  	@key.save
		# 	self.destroy
		# 	logger.debug ('============================')
		# 	logger.debug ('==== Line was destroyed ====')
		# 	logger.debug ('===== Key was deactive  ====')
		# 	logger.debug ('============================')
		# else 
		# 	logger.debug ('============================')
		# 	logger.debug ('==== Line was destroyed ====')
		# 	logger.debug ('============================')
		# end

	end
	#handle_asynchronously :reset_line#, :run_at => Proc.new { 5.minutes.from_now }
	# class Ready
		def reset_line
				logger.debug ('============================')
				logger.debug ('==== Line was destroyed ====')
				logger.debug ('===== Key was deactive  ====')
				logger.debug ('============================')
		end
	 	handle_asynchronously :reset_line, :run_at => Proc.new { 2.minutes.from_now }
end

