class HomeController < ApplicationController
  before_action :users_only, only: [:index]
  layout "layouts/internal"

  def index

  end

  private

  def users_only
  	unless current_user
    	redirect_to user_session_path, notice: "Please log in."
  	end
  end

end

