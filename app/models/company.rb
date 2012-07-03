class Company < ActiveRecord::Base
  attr_accessible :name, :print_code, :avatar, :blurb
  has_many :users
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"},
   :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/:style/:id/:filename"
    
  before_save do |company|
    company.name = company.name.titleize
  end
  
  before_destroy do |company|
    company.users.each do |u|
      u.destroy
    end
  end
  
end
