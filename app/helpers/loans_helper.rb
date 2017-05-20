module LoansHelper

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
  
end
