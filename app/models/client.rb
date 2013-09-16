class Client < ActiveRecord::Base
	attr_accessible :name, :comment, :photo
	has_attached_file :photo, :styles=>{:medium=>"220x127"}
end