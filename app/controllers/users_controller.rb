class UsersController < ApplicationController
    

    def new
        if session[:current_user_id]
            redirect_to current_page, notice: "Already logged in!!"
        else
            @user = User.new
        end
        
    end

    def show
        
        @review = Review.find(params[:id])
        @user = @review.user
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
