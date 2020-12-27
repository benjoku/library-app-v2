class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author))
    if @book.save
      flash[:notice] = 'Book was created successfully.'
      redirect_to @book
    else
      render 'new'
    end
  end

end