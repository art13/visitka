# encoding: utf-8
class Order < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	#belongs_to :questionnaire
	attr_accessible :user_id, :status, :ogrn, :manager_status,:manager_reason, :total,:name,:region, :address, :inn, :phone, :email, :faks, :contact, :manager, :bank_name, :ras_schet, :kor_schet, :bik	
	validates :email, :name,:phone,  :presence => true
	scope :cart, where(:status=>'cart')
	scope :ready, where(:status=>'ready')
before_destroy :delete_items
	def total
  		line_items.to_a.sum(&:amount)  		
  	end
private
	def delete_items
			self.line_items.each do |item|
				item.destroy
			end
	end
	
  	

end
