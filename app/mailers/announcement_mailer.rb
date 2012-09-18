class AnnouncementMailer < ActionMailer::Base
  default from: "tippingpointpartners86@gmail.com"

  def send_to (announcement)
  	@companies = Array.new
   	@announcement = announcement
  	recipients = Array.new

  	announcement.recipients.keys.each do |element|
  		@companies << Company.find(element)
  	end

  	@companies.each do |company|
  		company.users.each do |user|
  			recipients << user.email
  		end
  	end
  	

  	mail :to => recipients.join(","),
  	:subject => "#{@announcement.title}"			
  end
end
