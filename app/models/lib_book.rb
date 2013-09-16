class LibBook < ActiveRecord::Base
	has_many :books
	attr_accessible :title, :content, :photo, :book, :books, :books_attributes
	has_attached_file :photo
	accepts_nested_attributes_for :books, :allow_destroy =>true
end