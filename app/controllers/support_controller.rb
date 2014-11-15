class SupportController < ApplicationController
	layout "layouts/internal"
  def index
  	@tickets = Ticket.all.where(user_id: current_user.id)
  	@paginated_tickets = Ticket.all
  end
end
