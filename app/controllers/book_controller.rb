class BookController < ApplicationController
	  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
  	@books= Book.all
  	#puts 'hiiiiiiii'
  end

  def new
  	@book = Book.new
  end

  def show

  end

  def edit

  end

  def create
  	@book = Book.new(book_params)

  	respond_to do |format|
  		if @book.save
  			format.html { redirect_to  @book , notice: 'User was successfully created'}
  			format.json { render :show, status: :created, location: @book }

  		else 
  			format.html{ render :new}
  			format.json { render json: @book.errors, status: :unprocessable_entity }

  		end
  end
end

	def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@book.destroy
  	respond_to do |format|
  		format.html { redirect_to book_index_path, notice:'Book successfully deleted' }
      format.json { head :no_content }
  	end
  	
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author, :price, :comment)
    end
end



