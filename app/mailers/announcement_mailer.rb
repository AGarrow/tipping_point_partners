class AnnouncementMailer < ActionMailer::Base
  default from: "tippingpointpartners86@gmail.com"

  def send_to (announcement)
  	@companies = Array.new
   	@announcement = announcement
  	recipients = Array.new

#recipients is stored as a hash, with the value being 1
# if the key(company_id) is to be mailed to
  	announcement.recipients.each do |key,value|
      if value ==1
        @companies << Company.find(key)
      end
    end

  	@companies.each do |company|
  		company.users.each do |user|
  			recipients << user.email
  		end
  	end
  	

  	mail ( :to => @companies.join(","),
  	       :bcc => recipients.join(","),
           :subject => "#{@announcement.title}"			
  end
end
