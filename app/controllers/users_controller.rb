class UsersController < ApplicationController
  before_action :admin_only, only: [:index, :edit, :update, :destroy] # Makes sure only admins can view these pages
	before_action :set_user, only: [:show, :edit, :destroy, :update] # Sets user ID
	before_action :user_params, only: [:update] # Sets permitted params
  layout "layouts/internal"

  def index
  	if params[:approved] == "false"
      @users = User.where(:approved => false)
    else
      @users = User.where(:approved => true)
    end
  end

  def show

  end

  def edit

  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'The user was successfully updated.' }
        format.json {  }
      else
        format.html { redirect_to users_path, notice: 'Error updating user.' }
        format.json {  }
      end
    end
  end

  def destroy
  	respond_to do |format|
    	if @user.destroy
        	format.html { redirect_to root_path, notice: 'User successfully deleted.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, notice: 'Error deleting user.'  }
        	format.json {  }
    	end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:approved, :admin)
  end

  def admin_only
  	if current_user.admin != true
  		redirect_to root_path
  	end
  end
end

