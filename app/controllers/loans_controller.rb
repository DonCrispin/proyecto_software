class LoansController < ApplicationController
	before_action :set_loan, only: [:show, :update, :destroy]
  skip_before_filter  :verify_authenticity_token
  def index
    @loans = current_user.loans.where(active: [1, 0])
    if params[:page].present?
      @hist = current_user.loans.where(active: 2).paginate(:page => params[:page], :per_page => 10).order(:delivery_date)
    else
      @hist = current_user.loans.where(active: 2).paginate(:page => 1, :per_page => 10).order(:delivery_date)
    end
  end

  def user_loans
    user = User.find_by_id(params[:user_id])
    @loans = user.loans.where(active: [1, 0])
    
  end

  def show
  end

  def new
    @dates = (Date.today..Date.today+2)
  	@loan = current_user.loans.build
    @book = Book.find(params[:book_id])
    @copies = @book.copies.where(lended: false)
  end

  def edit
  	@loan = current_user.loans.find(params[:id])
    
  end

  def create
    @d = Date.parse("#{params[:loan][:delivery_date]}") if params[:loan][:delivery_date]
    @loan = current_user.loans.build(loan_params.merge(:return_date => @d + 7))
    if @loan.copy.lended == false
      if @loan.save
        @copy = @loan.copy
        @copy.lended = true
        @copy.save
      	redirect_to user_loans_path current_user, notice: 'Se ha registrado el préstamo.'
      else
        render :new
      end
    else
        flash[:alert] = "El libro ya está apartado!"
        redirect_to user_loans_path current_user, alert: 'El libro ya está apartado!'
    end
  end

  def return_loan
    if(params[:id].present?)
      @loan = Loan.find(params[:id])
      @loan.active = 2
      @loan.user_return = Date.today
      @loan.save
      @copy = @loan.copy
      @copy.lended = false
      @copy.save
      respond_to do |format|
        format.json { render json: @loan, status: :ok }
      end
    end
  end

  def cancel_loan
    if(params[:id].present?)
      @loan = Loan.find(params[:id])
      @copy = @loan.copy
      @copy.lended = false
      @copy.save
      @loan.destroy
      respond_to do |format|
        format.json { render json: "destroyed", status: :ok }
      end
    end
  end

  def add_loan
    @copy = Copy.find(params[:copy_id])
    @copy.lended = true
    @copy.save
    @loan = Loan.new
    @loan.user = User.find(params[:user_id])
    @loan.copy = @copy
    @loan.active = 1
    @loan.delivery_date = Date.today
    @loan.return_date = Date.today + 7
    if @loan.save
      respond_to do |format|
        format.json { render json: "Fue Guardado", status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: "No se pudo guardar", status: :unprocessable_entity }
      end
    end
    
  end

  private
    def set_loan
      @loan = Loan.find(params[:id])
      @loan
    end

    def loan_params
      params.require(:loan).permit(:delivery_date, :return_date, :copy_id)
    end
end
