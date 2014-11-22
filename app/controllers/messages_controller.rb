class MessagesController < ApplicationController
  before_action :set_message, only: [:show]
  before_action :set_user, only: [:new]
  before_action :internal, only: [:index, :show, :new]
  layout "layouts/internal"


  def index
  	@messages = Message.where(recipient_id: current_user.id).reverse
    @paginated_messages = Kaminari.paginate_array(@messages).page(params[:page]).per(10)
  	@sent_messages = Message.where(sender_id: current_user.id)
    if Message.where(recipient_id: current_user.id).count == 0
      @no_messages = "Your inbox is empty."
    end
  end

  def show
  	@message = Message.find(params[:id])
  	if current_user.id == @message.sender_id || @message.recipient_id
    	@message.read_message if @message.recipient_id == current_user.id
  	else
    	redirect_to root_path
	  end
  end

  def new
  	@newMessage = Message.new
  end

  def create
  	@newMessage = Message.create(message_params)
  	respond_to do |format|
  		if @newMessage.save
        	format.html { redirect_to messages_path, notice: 'User successfully deleted.' }
        	format.json {  }
   		else
        	format.html { redirect_to root_path, notice: 'Error deleting user.'  }
        	format.json {  }
    	end
	end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def message_params
  	params.require(:message).permit(:recipient_id, :sender_id, :body)
  end

end
