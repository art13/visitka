class LibBooksController < ApplicationController
 def index
 	@libs=LibBook.all
 end
 def show
 	@lib=LibBook.find(params[:id])
 end
end