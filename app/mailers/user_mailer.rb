class UserMailer < ActionMailer::Base
  default from: "tippingpointpartners86@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def registration_confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Welcome to Tipping Point!"
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"  
  end

  def claim_account(user, password)
    @user = user
    @password = password
    mail :to => user.email, :subject => "account created"
  end
end
