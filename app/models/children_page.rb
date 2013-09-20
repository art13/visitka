class ChildrenPage < ActiveRecord::Base
	belongs_to :page
	attr_accessible :title, :content, :photo, :page_id
	has_attached_file :photo, :styles=>{:medium=> "200x200", :small=>"100x100"}
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
end