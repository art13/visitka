class Questionnaire < ActiveRecord::Base
	#has_many :orders
	attr_accessible	 :name, :address, :inn, :phone, :email, :faks, :contact, :manager, :bank_name, :ras_schet, :kor_schet, :bik	

end