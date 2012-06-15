class Company < ActiveRecord::Base
  attr_accessible :name, :print_code, :avatar, :blurb
  has_many :users
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  
  before_save do |company|
    company.name = company.name.titleize
  end
  
  
  
end
