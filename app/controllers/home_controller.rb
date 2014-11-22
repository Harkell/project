class HomeController < ApplicationController
  before_action :users_only, only: [:index]
  before_action :internal, only: [:index]
  layout "layouts/internal"

  def index
    @updates = Update.all.last(5).reverse

  end

  private

  def users_only
  	unless current_user
    	redirect_to user_session_path, notice: "Please log in."
  	end
  end

end

