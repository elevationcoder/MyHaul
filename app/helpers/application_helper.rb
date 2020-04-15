module ApplicationHelper
    module SessionsHelper
        def current_user
            if session[:user_id]
                @current_user ||= User.find(session[:user_id]) if session[:user_id]
            end
        end

        def login(user)
            session[:user_id] = @user.id
        end

        def logged_in?
            !!current_user
        end
    end
end
