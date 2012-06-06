class Company < ActiveRecord::Base
  attr_accessible :name, :print_code
  has_many :users
  before_save do |company|
    company.name = company.name.titleize
  end
  
  
end
