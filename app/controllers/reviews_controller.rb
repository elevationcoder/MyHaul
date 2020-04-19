class ReviewsController < ApplicationController

    before_action :review_info, only: [:show, :edit, :update, :destroy]

    def new
        @review = Review.new
    end

    def show
        @review = Review.find(params[:id])
        @driver = Driver.find(params[:driver_id])
    end

    def create
        binding.pry
        @driver = Driver.find(params[:driver_id])
        @review = @driver.reviews.build(review_params)
        # binding.pry
        if @review.save
            # binding.pry
            redirect_to @review            
        else
            redirect_to @review
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
        @driver = Driver.find(params[:driver_id])
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to (@review.driver)
    end

    private

    def review_params
        params.require(:review).permit(:title, :content)
    end

    def review_info
        @review = Review.find(params[:id])
    end

end
