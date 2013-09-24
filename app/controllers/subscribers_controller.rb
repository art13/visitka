class SubscribersController < ApplicationController
	def create
		@flag=false
		@subscriber=Subscriber.new(params[:subscriber])
		if !@subscriber.save
				flash["sub_errors"] = @subscriber.errors.full_messages
		else
				@flag=true
				#SubscriberMailer.news_email(@subscriber).deliver
		end
		respond_to do |format|
			format.js
		end
	end
	
	private
		def email_news
			@posts=[]
			@begin=Date.current
			@end=@begin-7
			Post.all.each do |post|
				if post.created_at.to_date.between?(@end,@begin)
					@posts<<post
				end
			end
			return @posts	
			unless @posts.empty?
				SubscriberMailer.news_email(@posts).deliver
				raise "fail!"		
			end		
 	    end
end