class UsersController < ApplicationController
    

    def new
        @user = User.new
    end

    def show
        @user = User.find_by(params[:user_id])
    end

    def create

        @user = User.create(user_params)
        if @user.errors.any?
            render :new
        else
            session[:user_id] = @user.id
            if logged_in?
                redirect_to :root
            else
                redirect_to new_user_path(current_user)
            end
        end
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
