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
        elsif auth
            @user = User.find_or_create_by(email: auth['info']['email']) do |u|
                u.email = auth['info']['email']
                u.password = SecureRandom.hex(64)
            end
            session[:user_id] = @user.id
 
            redirect_to user_path(@user)
        elsif @user.nil?
            flash[:notice] = "This email doesn't exist"
            redirect_to action: "new"
        elsif params[:password].blank?
            flash[:notice] = "Password can't be blank"
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

    private

    def auth
        request.env['omniauth.auth']
    end

end
