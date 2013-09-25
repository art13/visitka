#encoding: utf-8
class SubscriberMailer < ActionMailer::Base
  def news_email(posts, subs, data)
  	@posts=posts
  	@data=data
	  	mail(:from=>data.email,:to=>subs.email, :subject=> " Свежие новости от #{data.name}" ).deliver  	
  end
end