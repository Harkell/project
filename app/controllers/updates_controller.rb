class UpdatesController < ApplicationController
	before_action :update_params, only: [:create]
  before_action :users_only, only: [:index, :show, :new, :edit, :create]

  def index
  	@updates = Update.all
  end
  def show
  end

  def new
  	@newUpdate = Update.new
  end

  def edit
  end

  def create
  	@newUpdate = Update.create(update_params)
  	@newUpdate.user_id = current_user.id
  	respond_to do |format|
    	if @newUpdate.save
        	format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, notice: 'Post was not successfully created.'  }
        	format.json {  }
    	end
    end
  end

  private

  def update_params
  	params.require(:update).permit(:title, :content, :user_id)
  end

  def users_only
    unless current_user
      redirect_to user_session_path, notice: "Please log in."
    end
  end

end
