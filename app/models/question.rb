class Question < ActiveRecord::Base
  attr_accessible :answer, :question,:picture
  validates_presence_of :question, :answer
  validates_uniqueness_of :question
  
  has_attached_file :picture,
    :storage => :s3,
    :s3_credentials => "config/s3.yml",
    :path => "/:style/:id/:filename"
end
