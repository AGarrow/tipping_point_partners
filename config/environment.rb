require 'ostruct'
require 'yaml'
::Secrets = OpenStruct.new(YAML.load_file(File.expand_path('../secrets.yml', __FILE__))[Rails.env])

# ::GlobalConfig = OpenStruct.new(YAML.load_file("#{RAILS_ROOT}/config/global_config.yml")[RAILS_ENV])


# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TippingPointPartners::Application.initialize!

#configure cancan for authorization
#config.gem "cancan"

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app5523529@heroku.com'],
  :password       => ENV['xjlovlcy'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp