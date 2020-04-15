class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        binding.pry

        redirect_to controller: 'welcome', action: 'home'
    end

    private

    def user_params
        params.require(:user).permit(:email)
    end

end
