class LoansController < ApplicationController
	before_action :set_loan, only: [:show, :update, :destroy]
  def index
    if params[:page].present?
      @loans = current_user.loans.paginate(:page => params[:page], :per_page => 10)
    else
      @loans = current_user.loans.paginate(:page => 1, :per_page => 10)
    end
  end

  def show
  end

  def new
    @dates = (Date.today..Date.today+2)
  	@loan = current_user.loans.build
    @book = Book.find(params[:book_id])
    @copies = @book.copies
  end

  def edit
  	@loan = current_user.loans.find(params[:id])
    
  end

  def create
    @d = Date.parse("#{params[:loan][:delivery_date]}") if params[:loan][:delivery_date]
    @loan = current_user.loans.build(loan_params.merge(:return_date => @d + 7))

    if @loan.save
    	redirect_to user_loans_path current_user, notice: 'Loan was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to user_loans_path current_user, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:delivery_date, :return_date, :copy_id)
    end
end
