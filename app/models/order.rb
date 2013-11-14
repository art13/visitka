# encoding: utf-8
class Order < ActiveRecord::Base
	has_many :line_items
	has_many :lic_keys
	belongs_to :user
	#belongs_to :questionnaire
	attr_accessible :user_id, :status,:order_create_time,:number, :ogrn, :manager_status,:manager_reason, :total,:name,:region, :address, :inn, :phone, :email, :faks, :contact, :manager, :bank_name, :ras_schet, :kor_schet, :bik	
	validates :email, :name,:phone,  :presence => true
	scope :cart, where(:status=>'Анкета')
	scope :obrabotka, where(:status=>'В обработке')
	scope :waiting, where(:status=>'Ожидание')
	scope :ready, where(:status=>'Договор')
	before_destroy :delete_items
	#before_validation :generate_order_number, on: :create
	
	def total
  		line_items.to_a.sum(&:amount)  		
  	end

  	# def generate_order_number
   #    record = true
   #    while record
   #      random="R#{Array.new(9){rand(9)}.join}"
   #      record=self.class.where(number: random).first
   #    end
   #    self.number=random if self.number.blank?
   #    self.number
   #  end

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
