class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :destroy, :update]
	before_action :user_params, only: [:update]
	before_action :approve_user, only: [:update]
	before_action :admin_only, only: [:index, :edit, :update, :destroy]
	layout "layouts/internal"

  def index
  	if params[:approved] == "false"
      @users = User.where(:approved => false)
    else
      @users = User.all
    end
  end

  def edit

  end

  def update
  	if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
end
  	respond_to do |format|
        format.html { redirect_to users_path, notice: 'Post was successfully created.' }
        format.json {  }
    end
  end

  def destroy
  	respond_to do |format|
    	if @user.destroy
        	format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, notice: 'Post was not successfully created.'  }
        	format.json {  }
    	end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:approved)
  end
  def approve_user
  	@approve = @user.update(:approved => true)
  end
  def admin_only
  	if current_user.email == "jordan@devonite.co.uk"
  		redirect_to root_path
  	end
  end
end

