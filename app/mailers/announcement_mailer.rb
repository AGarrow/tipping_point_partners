class AnnouncementMailer < ActionMailer::Base
  default from: "tippingpointpartners86@gmail.com"

  def send_to (announcement)
  	@companies = Array.new
   	@announcement = announcement
  	recipients = Array.new

  	announcement.recipients.each do |element|
  		@companies.insert(Company.find(element[1]))
  	end

  	@companies.each do |company|
  		recipients.insert(company.users.all)
  	end
  	

  	mail :to => recipients.collect(&:email).join(","),
  	:subject => "#{@announcement.title}"			
  end
end
