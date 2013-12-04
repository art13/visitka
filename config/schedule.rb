set :job_template, "/bin/bash -i -c ':job'"
every :wednesday, :at => '9pm' do 
  rake "deliver_email",:environment =>'production'
  puts'News deliver start'
end
 every :reboot do 
 	command "cd /apps/visitka/current && RAILS_ENV=production script/delayed_job start"
 	puts "delay is working now"
 end
 every 2.minutes do 
 	rake "destroy_lines", :environment =>'production'
 	puts "destroy after 10 minutes"
 end
 every :sunday do 
 	rake :empty_folder, :environment =>'production'
 	puts 'clearing folder files'
 end
#whenever --update-crontab