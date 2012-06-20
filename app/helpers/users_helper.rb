module UsersHelper
  def provided_phone? (user)
    !user.phone=nil
  end
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
      
  
  
  def gravatar_for(user)
    default_url = ""
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
end
