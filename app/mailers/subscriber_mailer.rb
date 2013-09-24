class SubscriberMailer < ActionMailer::Base
    default from:"loft.ibesk@gmail.com"
  def news_email(posts, subs)
  	@posts=posts
	  	mail(:to=>subs.email, :subject=> " dear send message" ).deliver  	
  end
end