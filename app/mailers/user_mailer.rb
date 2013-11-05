#encoding: utf-8
class UserMailer < ActionMailer::Base
	def registr_message(user, data)
		@user=user
		@data=data
		mail(:from=>'data.deliver_email', :to => user.email, :subject=>'Регистрация на сайте ЛОФТ')
	end
end
