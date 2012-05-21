# Load the rails application
require 'ostruct'
require 'yaml'
::Secrets = OpenStruct.new(YAML.load_file(File.expand_path('../secrets.yml',__FILE__))[Rails.env])
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TippingPointPartners::Application.initialize!
