class DriversController < ApplicationController
    before_action :logged_in?

    def new
        @driver = Driver.new
    end

    def create

    end

end
