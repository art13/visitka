class LibBook < ActiveRecord::Base
	has_many :books
	attr_accessible :title, :content, :photo, :book, :books, :books_attributes, :delete_photo
	has_attached_file :photo
	accepts_nested_attributes_for :books, :allow_destroy =>true
	attr_accessor :delete_photo
	before_validation { photo.clear if delete_photo == '1' }
	before_destroy :delete_books
	private
	def delete_books
		self.books.each do |item|
			item.destroy
		end
	end
end