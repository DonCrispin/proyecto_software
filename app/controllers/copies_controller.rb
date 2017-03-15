class CopiesController < ApplicationController
	before_action :set_copy, only: [:show, :update, :destroy]
  def index
    @book = Book.find params[:book_id]
    if params[:page].present?
      @copies = @book.copies.paginate(:page => params[:page], :per_page => 10)
    else
      @copies = @book.copies.paginate(:page => 1, :per_page => 10)
    end
  end

  def show
  end

  def new
  	@book = Book.find(params[:book_id])
    @copy = @book.copies.build
  end

  def edit
  	@book = Book.find(params[:book_id])
    @copy = @book.copies.find(params[:id])
    
  end

  def create
    @book = Book.find(params[:book_id])
    @copy = @book.copies.build(copy_params)

    respond_to do |format|
      if @copy.save
        format.html { redirect_to book_copies_path @book, notice: 'Copy was successfully created.' }
        format.json { render :show, status: :created, location: @copy.book }
      else
        format.html { render :new }
        format.json { render json: @copy.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @book = Book.find(params[:book_id])
    respond_to do |format|
      if @copy.update(copy_params)
        format.html { redirect_to book_copies_path @book, notice: 'Copy was successfully updated.' }
        format.json { render :show, status: :ok, location: @copy }
      else
        format.html { render :edit }
        format.json { render json: @copy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @copy.destroy
    respond_to do |format|
      format.html { redirect_to copies_url, notice: 'Copy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_copy
      @copy = Copy.find(params[:id])
    end

    def copy_params
      params.require(:copy).permit(:year, :location, :book_id)
    end
end
