class Company < ActiveRecord::Base
  attr_accessible :name, :print_code, :avatar, :blurb, :email_extension
  has_many :users, dependent: :destroy 
  has_many :announcements, dependent: :destroy
  has_attached_file :avatar, :styles => { :large => "360x268>",:medium_ish => "160x120>", :medium => "200x200>", :thumb => "100x100>"}
  
  validates :name, :print_code, :email_extension, presence: true, uniqueness: true
  
  
  before_save do |company|
    company.name = company.name.titleize
  end
  

  
end
