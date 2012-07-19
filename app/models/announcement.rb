class Announcement < ActiveRecord::Base
  attr_accessible :content, :title
  
  belongs_to :company
  
  validates :company_id, :content, :title, presence: true
  
  default_scope order: 'announcements.created_at DESC'
  
  self.per_page = 25
end
