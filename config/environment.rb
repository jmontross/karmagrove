# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USER'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'karmagrove.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


# Initialize the rails application
Karmagrove::Application.initialize!
