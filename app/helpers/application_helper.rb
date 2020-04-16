module ApplicationHelper
    module SessionsHelper
        extend ActiveSupport::Concern

        included do
            helper_method :current_user, :driver_on?, :current_user_type, :login, :logged_in?
        end
        
        private

        def current_user
            if session[:user_id]
                @current_user ||= User.find(session[:user_id]) 
            elsif session[:driver_id]
                @current_user ||= Driver.find(session[:driver_id])
                
            end
        end

        def driver_on?
            current_user_type == Driver
        end

        def current_user_type
            current_user&.class
        end

        def login(user)
            session[:user_id] = @user.id
        end

        def logged_in?
            !!current_user
        end
    end

end
