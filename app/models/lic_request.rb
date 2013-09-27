class LicRequest < ActiveRecord::Base
	#validates :email, :phone, :presence => true
	attr_accessible :name, :phone, :email, :confirmed
end