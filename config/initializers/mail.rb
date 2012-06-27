ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app5523529@heroku.com'],
  :password       => ENV['xjlovlcy'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp
