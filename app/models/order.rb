# encoding: utf-8
class Order < ActiveRecord::Base
	has_many :line_items
	has_many :lic_keys
	belongs_to :user
	#belongs_to :questionnaire
	attr_accessible :user_id, :status,:order_create_time,:number, :ogrn, :manager_status,:manager_reason, :total,:name,:region, :address, :inn, :phone, :email, :faks, :contact, :manager, :bank_name, :ras_schet, :kor_schet, :bik	
	#validates :email, :name, :phone,  :presence => true
	scope :cart, where(:status=>'Анкета')
	scope :obrabotka, where(:status=>'В обработке')
	scope :waiting, where(:status=>'Ожидание')
	scope :ready, where(:status=>'Договор')
	validates :number, :uniqueness => true
	before_destroy :delete_items
	def total
  		line_items.to_a.sum(&:amount)  		
  	end
private
	def delete_items
			self.line_items.each do |item|
				item.destroy
			end
			self.lic_keys.each do |key|
				key.destroy
			end
	end
	
  	

end
