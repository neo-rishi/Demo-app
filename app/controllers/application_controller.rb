class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  # use for authentication
    def authenticate
      if session[:id].blank?
        redirect_to signin_users_path, alert: 'you are not authenticate! ....'
      end
    end

    def current_user
      @current_user ||= User.where(id: session[:id]).first
    end
    helper_method :current_user
end
