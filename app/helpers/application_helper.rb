module ApplicationHelper
    module SessionsHelper
        def current_user
            if session[:user_id]
                @current_user ||= User.find(session[:user_id]) 
            end
        end

        def login(user)
            session[:user_id] = @user.id
        end

        def logged_in?
            !!current_user
        end
    end

    # module DriverSessionsHelper
    #     def driver_user
    #         if session[:driver_id]
    #             @driver_user ||= Driver.find(session[:driver_id]) if session[:driver_id]
    #         end
    #     end

    #     def login(driver)
    #         session[:driver_id] = @driver.id
    #     end

    #     def driver_on?
    #         !!driver_user
    #     end

    # end
end
