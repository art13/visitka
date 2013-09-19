class PostsController < ApplicationController
	def index
		@posts=Post.all
		@news=Kaminari.paginate_array(@posts).page(params[:page]).per(10)
	end
	def show
		@post=Post.find(params[:id])	
	end
end 