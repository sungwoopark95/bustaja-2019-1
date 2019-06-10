module SessionsHelper
    def login(user)
        session[:user_id] = user.id
    end
    
    def current_user
        if @current_user.nil?
            @current_user = User.find_by(id: session[:user_id])
        end
        return @current_user
    end
    
    def user_signed_in?
        return !current_user.nil?
    end
    
    def logout
        session.delete(:user_id)
        @current_user = nil
    end
end
