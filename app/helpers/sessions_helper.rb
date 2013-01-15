module SessionsHelper
  protected 
    def sign_in(user)
       session[:user_id] = user.id
       @current_user = user
    end
    def signed_in?
      !@current_user.nil? || !current_user.nil?
    end
    
    
    def current_user
      @current_user ||=User.find(session[:user_id]) if session[:user_id]
    end
    
    def sign_out
      @current_user = nil
      current_user = nil
      session[:user_id] = nil
    end
    
end
