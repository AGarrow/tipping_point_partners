class AnnouncementMailer < ActionMailer::Base
  default from: "tippingpointpartners86@gmail.com"

  def send_to (announcement,company)
  	@announcement = announcement
  	@company = company
  	mail :to => company.users.all.map(&:email),
  	:subject => "#{@announcement.title}"			
  end
end
