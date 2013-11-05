set :job_template, "/bin/bash -i -c ':job'"
every :wednesday, :at => '9pm' do 
  rake "deliver_email",:environment =>'production'
  puts'News deliver start'
end
 every :reboot do 
 	rake "jobs:work", :environment =>'production'
 	puts "delay is working now"
 end
#whenever --update-crontab