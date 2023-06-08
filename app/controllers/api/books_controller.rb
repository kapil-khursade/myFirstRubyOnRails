class Api::BooksController < ApplicationController
  def index
    name = params[:name]
    @books = Book.where("name LIKE ?", "%#{name}%")
    @books
  end
end
