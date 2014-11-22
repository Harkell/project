class BranchesController < ApplicationController
  before_action :branch_params, only: [:create]
  before_action :internal, only: [:index, :new, :show]
  layout "layouts/internal"

  def index
    @branches = Branch.offset(1).all
  end
  def new
  	@newBranch = Branch.new
  end
  def create
  	@newBranch = Branch.create(branch_params)
  	respond_to do |format|
  		if @newBranch.save
        	format.html { redirect_to root_path, notice: 'User successfully deleted.' }
        	format.json {  }
   		else
        	format.html { redirect_to root_path, notice: 'Error deleting user.'  }
        	format.json {  }
        end
    end
  end
  def show

  end

  private

  def branch_params
  	params.require(:branch).permit(:name)
  end

end
