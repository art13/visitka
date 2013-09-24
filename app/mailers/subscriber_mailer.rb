class SubscriberMailer < ActionMailer::Base
    default from: "loft.ibesk@gmail.com",
    	to: Subscriber.pluck(:email)
  def news_email(posts)
  	#@subscriber=subscriber
  	@posts=posts
  	mail(:subject=> " dear send message" )  	
  	logger.debug('email_message')
  end
end