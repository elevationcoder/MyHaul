class DriversController < ApplicationController
    # before_action :authentication_required

    def index
        @drivers = Driver.all
    end

    def new
        @driver = Driver.new
    end

    def create
        @driver = Driver.create(driver_params)
        if @driver.save
            redirect_to drivers_path(@driver)            
        else
            render :new
        end
    end

    private

    def driver_params
        params.require(:driver).permit(:name, :password, :password_confirmation, :license, :truck_type, :truck_size)
    end

end
