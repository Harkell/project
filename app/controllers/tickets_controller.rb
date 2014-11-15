class TicketsController < ApplicationController
	before_action :admin_only, only: [:index]
	before_action :set_user, only: []
	before_action :user_params, only: []
	layout "layouts/internal"

  def index
  end

  def show

  end

  def new
  	@new_ticket = Ticket.new
  end

  def create
  	@new_ticket = Ticket.create(ticket_params)
  	respond_to do |format|
    	if @new_ticket.save
        	format.html { redirect_to support_index_path, notice: 'Post was successfully created.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, notice: 'Post was not successfully created.'  }
        	format.json {  }
    	end
    end
  end

  private

  def set_ticket
    @user = Ticket.find(params[:id])
  end
  def ticket_params
  	params.require(:ticket).permit(:subject, :content, :closed, :user_id)
  end

  def admin_only
  	if current_user.admin != true
  		redirect_to root_path
  	end
  end

end
