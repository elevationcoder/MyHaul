class ReviewsController < ApplicationController

    before_action :review_info, only: [:show, :edit, :update, :destroy]

    def index
        # binding.pry
        review = Review.all.find_by(id: params[:driver_id])
        driver =  review.driver
        @reviews = driver.reviews
    end
    
    def new
        @driver = Driver.find(params[:driver_id])
        @review = @driver.reviews.new()
    end

    def show
        
        @review = Review.find(params[:id])
        @driver = @review.driver
        @user = @review.user
    end

    def create
        # binding.pry
        @driver = Driver.find(params[:driver_id])
        @review = @driver.reviews.new(review_params)
        @review.user = current_user
        if @review.save
            # binding.pry
            redirect_to driver_reviews_path(@driver)            
        else
            render new_driver_review(@driver, @review)
        end
    end

    def edit
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to driver_path(@review.driver)

    end

    def destroy
        
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to user_path(current_user) 
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :user_id)
    end

    def review_info
        @review = Review.find(params[:id])
    end

end
