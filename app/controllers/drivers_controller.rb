class DriversController < ApplicationController
    before_action :driver_info, only: [:show, :update, :edit, :destroy]

    def index
        @drivers = Driver.search(params[:search])
    end

    def show
        # binding.pry
        @review = Review.find(params[:id])
        @driver = @review.driver
    end


    def new
        @driver = Driver.new
    end

    def create
        @driver = Driver.create(driver_params)
        if @driver.save
            redirect_to :root            
        else
            render :new
        end
    end

    def update
    end

    private

    def driver_params
        params.require(:driver).permit(:name, :email, :password, :password_confirmation, :license, :truck_type, :truck_size, :search)
    end

    def driver_info
        @driver = Driver.find(params[:id])
    end

end
