class LicRequest < ActiveRecord::Base
	validates :email, :region, :presence => true
	attr_accessible :name, :phone, :email, :confirmed, :region, :contact
end