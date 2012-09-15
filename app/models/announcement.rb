class Announcement < ActiveRecord::Base
  require 'rails_autolink'
  attr_accessible :content, :title, :public
  
  belongs_to :company
  
  validates :company_id, :content, :title, presence: true
  
  default_scope order: 'announcements.created_at DESC'
  
  self.per_page = 25

  def send_to_recipient (company)
    AnnouncementMailer.send_to(self,company).deliver
    	  	
  end
end
