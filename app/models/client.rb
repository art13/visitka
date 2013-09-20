class Client < ActiveRecord::Base
	attr_accessible :name, :comment, :photo
	validates_length_of :comment, :maximum=>200
	has_attached_file :photo, :styles=>{:medium=>"220x127"}
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end