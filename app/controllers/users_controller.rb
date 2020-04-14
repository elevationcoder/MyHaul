class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.email = params[:email]
        @user.save

        redirect_to "/login"
    end

    private

    def user_params
        params.require(:users).permit(:email)
    end

end
