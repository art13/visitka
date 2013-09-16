class Book < ActiveRecord::Base
	belongs_to :lib_book
	attr_accessible :book_file_name,:book ,:alter_name, :book_content_type, :book_file_size, :book_updated_at, :lib_book_id
	has_attached_file :book,
                      :url=> '/system/releases/:basename.:extension',
                      :patch =>':rails_root/public/system/releases/:basename.:extension'
                      #:default_url => "/assets/:style/rails.png",
  										#:content_type => ["application/pdf","application/","application/tgz"]	
end