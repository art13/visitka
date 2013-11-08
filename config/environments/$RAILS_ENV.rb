config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'loft-leshoz.ru',
  :user_name            =>  DataContact.first.deliver_email.split('@').first,
  :password             =>  DataContact.first.deliver_pass,
  :authentication       => "plain",
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = "loft-leshoz.ru"