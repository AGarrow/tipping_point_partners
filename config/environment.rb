require 'ostruct'
require 'yaml'
#::Secrets = OpenStruct.new(YAML.load_file(File.expand_path('../secrets.yml', __FILE__))[Rails.env])

# ::GlobalConfig = OpenStruct.new(YAML.load_file("#{RAILS_ROOT}/config/global_config.yml")[RAILS_ENV])


# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application

#configure cancan for authorization
#config.gem "cancan"

ActionMailer::Base.smtp_settings = {
:user_name => "tippingpointpartners86@gmail.com",
:password => "Chambers",
:domain => "tpp.herokuapp.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp

TippingPointPartners::Application.initialize!
