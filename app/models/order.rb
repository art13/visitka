class Order < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	#belongs_to :questionnaire
	attr_accessible :user_id, :status, :total,:name, :address, :inn, :phone, :email, :faks, :contact, :manager, :bank_name, :ras_schet, :kor_schet, :bik	
	validates :email, :name,:phone,  :presence => true
before_destroy :delete_items
private
	def delete_items
			self.line_items.each do |item|
				item.destroy
			end
	end
	
  	def total
  		line_items.to_a.sum(&:amount)  		
  	end

end
