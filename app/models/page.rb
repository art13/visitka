class Page < ActiveRecord::Base
	has_many :children_pages
	attr_accessible :title, :content, :photo, :preview, :delete_photo
	has_attached_file :photo, :styles=>{:large=>"400x400",:medium=> "200x200", :small=>"100x100"}
	validates_length_of :preview, :maximum=>200
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end