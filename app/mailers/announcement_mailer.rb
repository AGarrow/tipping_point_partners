class AnnouncementMailer < ActionMailer::Base
  default from: "tippingpointpartners86@gmail.com"

  def send_to (announcement)
  	@companies = Array.new
   	@announcement = announcement
    displayed_recipients = Array.new
  	real_recipients = Array.new

#recipients is stored as a hash, with the value being 1
# if the key(company_id) is to be mailed to
  	announcement.recipients.each do |key,value|
      if value ==1
        @companies << Company.find(key)
      end
    end

  	@companies.each do |company|
      displayed_recipients << company.name
  		company.users.each do |user|
  			recipients << user.email
  		end
  	end
  	

  	mail   :to => displayed_recipients.join(","),
  	       :bcc => real_recipients.join(","),
           :subject => "#{@announcement.title}"			
  end
end
