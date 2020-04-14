class SessionsController < ApplicationController

    def new
        if session[:user_id]
            redirect_to controller: 'welcome', action: 'home'
        end
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user
            login(@user)
            redirect_to controller: 'welcome', action: 'home'
        else
            redirect_to "/login", :notice => "Not Here!"
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end
