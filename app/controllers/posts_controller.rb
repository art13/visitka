class PostsController < ApplicationController
	def index
		@posts = Post.find(:all, :order =>"created_at DESC")
		@news = Kaminari.paginate_array(@posts).page(params[:page]).per(15)
	end
	def show
		@post = Post.find(params[:id])
	end
	
		 #handle_asynchronously :email_news, :run_at=>Proc.new{1.minutes.from_now}
end 