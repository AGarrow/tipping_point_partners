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

