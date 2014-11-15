class PanelController < ApplicationController
  before_action :admin_only, only: [:index]
  layout "layouts/internal"

  def index
  end

  private

  def admin_only
  	if current_user.admin != true
  		redirect_to root_path
  	end
  end

end
