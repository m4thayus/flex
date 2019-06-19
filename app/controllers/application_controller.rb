class ApplicationController < ActionController::Base
    helper_method :get_current_user, :get_current_username

    def get_current_user
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(id: session[:user_id])
        end
    end

    def get_current_username
        user = get_current_user
        if user
            return user.username
        end
    end

    def logged_in?
        !!get_current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end
end
