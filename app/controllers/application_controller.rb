class ApplicationController < ActionController::Base
    include ApplicationHelper::SessionsHelper
    protect_from_forgery with: :exception

    

     private

     def authentication_required
        if !logged_in?
            redirect_to "/"
        end
    end

end
