class Post < ActiveRecord::Base
	attr_accessible :title, :content, :photo
	has_attached_file :photo, :styles =>{
 							:small=>"64x64",
 							:medium=>"220x127",
 							:large => '620x350'	
						 }
end