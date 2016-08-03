class SubscribersController < ApplicationController
	def create
		@flag = false
		@subscriber = Subscriber.new(params[:subscriber])
		unless @subscriber.save
				flash["sub_errors"] = @subscriber.errors.full_messages
		else
				@flag = true
		end
		respond_to do |format|
			format.js
		end
	end
	
	private
		def email_news
			@posts = []
			@begin = Date.current
			@end = @begin-7
			Post.all.each.map{|post| @posts << post if post.created_at.to_date.between?(@end,@begin)}
			SubscriberMailer.news_email(@posts) unless @posts.empty?		
 	    end
end