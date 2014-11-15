class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :internal, only: [:home]

  def internal # Feeds variables to the 'internal' layout
    @unread_message_count = Message.where(recipient_id: current_user.id, read_at: nil).count 
    @branch_name = Branch.find(@current_user.branch_id).name
  end

  protected
	before_filter :update_sanitized_params, if: :devise_controller?

    	def update_sanitized_params # Allows for additional forename and surname attributes to be passed in through the sign up form + branch_id
       		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:forename, :surname, :email, :branch_id,	:password, :password_confirmation)}
    	end

end
