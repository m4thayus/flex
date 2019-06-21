class ApplicationController < ActionController::Base
    helper_method :get_current_user, :logged_in?
    # protect_from_forgery prepend: true, with: :exception
    # 
    # protected

    def get_current_user
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(id: session[:user_id])
        end
    end

    def admin?
        user = get_current_user
        if user
            return user.admin
        end
    end

    def logged_in?
        !!get_current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end
    
    def authorized_admin
        redirect_to login_path unless admin?
    end
end
