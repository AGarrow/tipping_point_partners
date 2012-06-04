class Employee < ActiveRecord::Base
  belongs_to :company
  attr_accessible :email, :name
  before_save {|employee| employee.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  

end
