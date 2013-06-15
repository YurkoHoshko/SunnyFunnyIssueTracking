# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OnappTask::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    #:tls => true,
    :address        => 'smtp.gmail.com',
    :domain         => 'smtp.gmail.com',
    :port           => 587,
    :user_name      => 'yurko25@gmail.com',
    :password       => 'cypress,ktfnm',
    :authentication => :plain
}
ActionMailer::Base.default_url_options[:host] = '127.0.0.1:3000'

