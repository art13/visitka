every :wednesday, :at => '9pm' do 
  rake "deliver_email",:environment =>'development'
  puts'omnomnomn0mn'
end