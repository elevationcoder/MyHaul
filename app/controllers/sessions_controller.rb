class SessionsController < ApplicationController

    def new
        if session[:user_id]
            redirect_to controller: 'welcome', action: 'home'
        end
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user
            if user.authenticate(params[:password])
                login(@user)
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
