class ChildrenPage < ActiveRecord::Base
	belongs_to :page
	attr_accessible :title, :content, :photo, :page_id, :delete_photo
	has_attached_file :photo, :styles=>{:large=>"400x400",:medium=> "200x200", :small=>"100x100"}
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end