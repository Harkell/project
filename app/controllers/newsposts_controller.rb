class NewspostsController < ApplicationController
	before_action :newspost_params, only: [:create]
  before_action :users_only, only: [:index, :show, :new, :edit, :create]
  before_action :set_newspost, only: [:edit, :update]

  def index
  	@newsposts = Newspost.all
  end
  def show

  end

  def new
  	@newNewspost = Newspost.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @newspost.update(newspost_params)
        format.html { redirect_to newsposts_path, notice: 'Post was successfully created.' }
        format.json {  }
      else
        redirect_to root_path
      end
    end
  end

  def create
  	@newNewspost = Newspost.create(newspost_params)
  	@newNewspost.user_id = current_user.id
  	respond_to do |format|
    	if @newNewspost.save
        	format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, notice: 'Post was not successfully created.'  }
        	format.json {  }
    	end
    end
  end

  def destroy

  end

  private

  def newspost_params
  	params.require(:newspost).permit(:title, :content, :user_id)
  end

  def users_only
    unless current_user
      redirect_to user_session_path, notice: "Please log in."
    end
  end

  def set_newspost
    @newspost = Newspost.find(params[:id])
  end

end
