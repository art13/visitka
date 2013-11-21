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
		puts 'destroy all human'
		@lines.destroy_all
		if @lines.empty?
			puts 'alles kaput'
		else
			puts 'failure'
		end	
	end
end
desc "enccrypt"
task :encrypt => :environment do 
	    key='1031-13d5a-c6322fproverka'
	    aes=FastAES.new(key)
		#file=File.open('/home/art/apps/visitka/public/system/Регламент продаж Лофт.doc')
		#openssl  aes-256-cbc -in /home/art/apps/visitka/public/system/1.doc -out /home/art/apps/visitka/public/system/2.enc
		#
end