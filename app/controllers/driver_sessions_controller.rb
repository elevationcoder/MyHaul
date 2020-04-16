class DriverSessionsController < ApplicationController
    def new
        if session[:driver_id]
            redirect_to controller: 'welcome', action: 'home'
        end
    end

    def create
        @driver = Driver.find_by(email: params[:email])
        if @driver
            if @driver.authenticate(params[:password])
                login(@driver)
                redirect_to root_path
            elsif params[:password].blank? alert: "Not Here!"
                redirect_to action: 'new'
            end
        else
            redirect_to "/", :notice => "Not Here!"
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end
end
