class PostsController < ApplicationController
	def index
		@posts=Post.find(:all, :order =>"created_at DESC")
		@news=Kaminari.paginate_array(@posts).page(params[:page]).per(10)
	end
	def show
		@post=Post.find(params[:id])	
	end
end 