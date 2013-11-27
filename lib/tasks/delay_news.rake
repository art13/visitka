# encoding: utf-8
desc "deliver_email"
task :deliver_email => :environment do
			@posts=[]
			@data=DataContact.first
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
					SubscriberMailer.news_email(@posts, subs, @data)
				end	
			end		
end
desc "destroy_lines"
task :destroy_lines => :environment do 
	puts 'Initialisation...'
	@lines=Installment.where(:state=>'post_request')
	if @lines.empty?
		puts 'already empty'
	else	
		@lines.each do |line|
			if line.updated_at+10.minutes < Time.now
				puts "line with id #{line.id} destroy"
				line.destroy
			else 
				puts 'time gut'
			end
		end
		puts 'destroy all human'	
	end
end