class ReviewsController < ApplicationController

    before_action :review_info, only: [:show, :edit, :update, :destroy]

    def index
        @id = params[:driver_id]
        @reviews = Driver.find(@id).reviews.all
    end
    
    def new
        @driver = Driver.find(params[:driver_id])
        @review = @driver.reviews.new()
    end

    def show
        @review = Review.find(params[:review_id])
        @driver = Driver.find(params[:driver_id])
    end

    def create
        # binding.pry
        @driver = Driver.find(params[:driver_id])
        @review = @driver.reviews.new(review_params)
        @review.user = current_user
        if @review.save
            # binding.pry
            redirect_to driver_reviews_path(@driver, @review)            
        else
            render new_driver_review(@driver, @review)
        end
    end

    def edit
    end

    def update
        @driver = Driver.find(params[:driver_id])
        @review = Review.find(params[:id])
        if @review.save
            redirect_to @driver
        else
            redirect_to @driver
        end

    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to (@review.driver)
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :user_id)
    end

    def review_info
        @review = Review.find(params[:id])
    end

end
