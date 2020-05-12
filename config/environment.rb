# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :domain => 'gmail.com',
  :address => 'smtp.sendgrid.net',
  :port                => 587,
  :user_name => ENV['SENDGRID_LOGIN'],
  :password => ENV['SENDGRID_PWD'],
  :authentication      => 'plain',
  :enable_starttls_auto => true }