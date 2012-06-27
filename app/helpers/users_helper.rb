module UsersHelper
  def name(user)
    name = [user.first_name,user.last_name].join(' ')
  end
  
##  def avatar_for (user)
##    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
##      if gravatar_id == 40
##        user.avatar
##      else
##        gravatar_for(user)
##      end
##  end
  

end
