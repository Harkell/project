class SupportController < ApplicationController
	layout "layouts/internal"
  def index
  	@tickets = Ticket.all.where(user_id: current_user.id).reverse
  	@paginated_tickets = Kaminari.paginate_array(@tickets).page(params[:page]).per(5)
  end
end
