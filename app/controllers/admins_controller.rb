class AdminsController < ApplicationController
	def show
		@par = "n"
		@ausers = User.all
		if params[:book].present?
			@par = "b"
			@books = Book.search(params[:book]).paginate(:page => params[:page], :per_page => 10).order(:title)
		else
			@books = Book.search(params[:book]).paginate(:page => 1, :per_page => 10).order(:title)
		end

		if params[:user].present?
			@par = "u"
			@users = User.search(params[:user]).paginate(:page => params[:page], :per_page => 10).order(:name)
		else
			@users = User.search(params[:user]).paginate(:page => 1, :per_page => 10).order(:title)
		end
	end

	def check_user
		user = User.find_by_email(params[:email])
		if !user.nil?
			if user.valid_password?(params[:password])
				respond_to do |format|
					format.json { render json: "Correct", status: :ok }
				end
			else
				respond_to do |format|
					format.json { render json: "Incorrect", status: :ok }
				end
			end
		else
			respond_to do |format|
				format.json { render json: "Incorrect", status: :ok }
			end
		end
	end
end
