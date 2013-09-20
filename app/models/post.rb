class Post < ActiveRecord::Base
	attr_accessible :title, :content, :photo, :preview,:delete_photo
	validates_length_of :preview, :maximum=>200
	has_attached_file :photo, :styles =>{
 							:small=>"64x64",
 							:medium=>"220x127",
 							:large => '620x350'	
						 }
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end