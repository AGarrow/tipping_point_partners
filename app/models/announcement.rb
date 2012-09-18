class Announcement < ActiveRecord::Base
  require 'rails_autolink'
  attr_accessible :content, :title, :public, :recipients
  attr_accessor :recipients
    serialize :recipients, Hash
  
  

  belongs_to :company
  validates :company_id, :content, :title, presence: true 
  default_scope order: 'announcements.created_at DESC'
  self.per_page = 25

  before_save do |announcement|
  #  announcement.recipients.to_hash
  end


  def send_to_recipient 
    AnnouncementMailer.send_to(self).deliver
    	  	
  end
end
