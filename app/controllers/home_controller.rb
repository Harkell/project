class HomeController < ApplicationController
  before_action :users_only, only: [:index]
  before_action :internal, only: [:index]
  layout "layouts/internal"

  def index
    @updates = Update.all.reverse
    @paginated_updates = Kaminari.paginate_array(@updates).page(params[:page]).per(5)

  end

  private

  def users_only
  	unless current_user
    	redirect_to user_session_path, notice: "Please log in."
  	end
  end

end

