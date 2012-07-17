module UsersHelper
  

  def name(user)
    name = [user.first_name,user.last_name].join(' ')
  end
  
  def list_email (user)
    if user.email.length > 26
      user.email[0,22]<<".."
    else
      user.email
    end
  end
  
  def validation_sent?
     user= current_user
     !user.validation_token.nil?
  end
  
  def validated?
    user=current_user
    !user.role.nil?
  end
  

end
