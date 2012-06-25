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
      
  
  def display_avatar(user)
    if user.avatar?
      image_tag(user.avatar, :size => "120x120")
    else
      gravatar_for(user)
    end
  end
  
  def gravatar_for(user)
    require 'net/http'
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{404}"
    uri= URI(gravatar_url)
    res = Net::HTTP.get_response(uri)
    if res.is_a? (Net::HTTPNotFound)
      nil
    else
      image_tag(gravatar_url, alt: user.first_name, class: "gravatar",:size =>"120x120")
    end  
  end
end
