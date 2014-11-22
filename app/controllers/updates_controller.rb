class UpdatesController < ApplicationController
  layout "layouts/internal"

  def index
  end


  def edit
  end

  def create
  	@new_update = Update.create(update_params)
  	respond_to do |format|
    	if @new_update.save
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
  	params.require(:update).permit(:user_id, :content)
  end

end
