class UsersController < ApplicationController
	def show
		@loans = current_user.loans.where(active: [1, 0])
		if params[:page].present?
			@hist = current_user.loans.where(active: 2).paginate(:page => params[:page], :per_page => 10).order(:delivery_date)
		else
			@hist = current_user.loans.where(active: 2).paginate(:page => 1, :per_page => 10).order(:delivery_date)
		end
	end

	def index
		if params[:search].present?
			@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => 10).order(:name)
		else
			@users = User.search(params[:search]).paginate(:page => 1, :per_page => 10).order(:name)
		end
	end
end
