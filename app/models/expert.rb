class Expert < ActiveRecord::Base
 attr_accessible :firstname, :secondname, :lastname, :email, :phone, :photo
 has_attached_file :photo, :styles =>{
 							:small=>"64x67",
 							:medium=>"192x198"	
						 }
						 attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end