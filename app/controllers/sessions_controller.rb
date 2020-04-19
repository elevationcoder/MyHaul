class SessionsController < ApplicationController

    def new
        if session[:user_id]
            redirect_to controller: 'welcome', action: 'home'
        end
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            flash[:message] = "You successfully logged in! Welcome, #{@user.email}!"
            redirect_to user_path(@user)
        elsif @user.nil?
            flash[:notice] = "This email doesn't exist"
            redirect_to action: "new"
        elsif params[:password].blank?
            flash[:notice] = "Password can't ew blank"
            redirect_to action: "new"
        elsif @user && !@user.authenticate(params[:password])
            flash[:notice] = "Incorrect password!"
            redirect_to action: "new"
        else
            redirect_to "/"
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end
