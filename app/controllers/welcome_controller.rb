class WelcomeController < ApplicationController
    before_action :authentication_required

    def home
    end

end