class BooksController < ApplicationController
  skip_before_action :authorize, only: [:index, :show, :search]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    Book.create!(book_params)
    redirect_to books_path, notice: 'Book Created Successfully'             
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  def search
    @books = Book.includes(:shelf => :section).where('name LIKE ?', "%#{params[:name]}%")
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :publication_year, :shelf_id)
  end
end