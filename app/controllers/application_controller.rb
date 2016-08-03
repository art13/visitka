class ApplicationController < ActionController::Base
  	protect_from_forgery

 	before_filter :get_info_for_shared
    
  	private 
  
	 def get_info_for_shared
	  	@data_contacts = DataContact.first
	  	@data_pages = Page.all
	  	@data_libs = LibBook.all
	 end
end
