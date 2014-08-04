class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  # use for authentication
    def authenticate
      if session[:user].blank?
        redirect_to signin_users_path, alert: 'you are not authenticate! ....'
      end
    end

end
