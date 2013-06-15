# encoding: utf-8
class CustomerMailer < ActionMailer::Base
  default from: "yurko25@gmail.com"
def new_query_email(query)
    @query=query
    @url  = url_for(@query)
    mail(:to => query.customer_email, :subject => "New ticket created")
  end

  def updated_query_email(query)
    @messages=message
    @query=query
    @url  = url_for(@query)
    mail(:to => query.customer_email, :subject => "Yours ticket successfully updated")
  end

   def reply_query_email(query,message)
    @messages=message
    @query=query
    @url  = url_for(@query)
    mail(:to => query.customer_email, :subject => "Yours ticket successfully updated")
  end
end
