# encoding: utf-8
desc "deliver_email"
task :deliver_email => :environment do
			@posts=[]
			@begin=Date.current
			@end=@begin-7
			posts=Post.find(:all)
			posts.each do |post|
				if post.created_at.to_date.between?(@end,@begin)
					@posts<<post
				end
			end
			unless @posts.empty?
				Subscriber.all.each do |subs|
					SubscriberMailer.news_email(@posts, subs)
				end	
			end		
end