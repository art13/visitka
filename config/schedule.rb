set :job_template, "/bin/bash -i -c ':job'"
every :wednesday, :at => '9pm' do 
  rake "deliver_email",:environment =>'production'
  puts'omnomnomn0mn'
end
#whenever --update-crontab