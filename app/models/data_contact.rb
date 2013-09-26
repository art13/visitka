class DataContact < ActiveRecord::Base
	attr_accessible :name, :about, :email, :phone, :address, :preview, :photo, :delete_photo, :deliver_email, :deliver_pass
	has_attached_file :photo, :styles=>{:medium=> '300x180'}
	validates_length_of :preview, :maximum=>300
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end