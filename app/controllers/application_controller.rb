class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
	before_filter :update_sanitized_params, if: :devise_controller?

    	def update_sanitized_params # Allows for additional forename and surname attributes to be passed in through the sign up form
       		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:forename, :surname, :email,	:password, :password_confirmation)}
    	end

end
