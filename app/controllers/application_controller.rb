class ApplicationController < ActionController::Base
    include ApplicationHelper::SessionsHelper
    protect_from_forgery with: :exception


end
