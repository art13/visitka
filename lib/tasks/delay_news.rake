# encoding: utf-8
desc "deliver_email"
task :deliver_email => :environment do
			@posts = []
			@data = DataContact.first
			@begin = Time.current
			@end = @begin - 7
			posts = Post.all
			posts.map{ |post| @posts << post if post.created_at.to_date.between?(@end,@begin)}.compact
			unless @posts.empty?
				Subscriber.all.each do |subs|
					SubscriberMailer.news_email(@posts, subs, @data)
				end	
			end		
end
desc "destroy_lines"
task :destroy_lines => :environment do 
	puts 'Initialisation...'
	@lines = Installment.where('state !=?','instalation_complete')
	if @lines.empty?
		puts 'already empty'
	else	
		@lines.each do |line|
			if line.updated_at.to_time + 10.minutes < Time.current
				puts "line with id #{line.id} destroy"
				@key = LicKey.find_by_lic(line.license_key)
				@key.update_attributes(:status => 'Не активирован') if @key && @key.status != 'Активирован' 
				line.destroy
			else 
				puts 'time gut'
			end
		end
		puts 'destroy all humans'	
	end
end

desc 'clear_folder'
task :empty_folder => :environment do 
	if Installment.where('state !=?','instalation_complete').empty?
		@path = File.join(Rails.root.to_s,'public','system')
		system "rm -rf #{@path}files"
		system "mkdir #{@path}files"
		puts 'folder clear'
	else
		puts 'process in action'
	end
end