module UsersHelper
  def provided_phone? (user)
    !user.phone=nil
  end
end
