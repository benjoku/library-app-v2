class BooksController < ApplicationController
  before_action :find_book_by_id, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(getting_book_params)
    if @book.save
      flash[:notice] = 'Book was created successfully.'
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @book.update(getting_book_params)
    if @book.save
      flash[:notice] = 'Book was updated successfully.'
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def find_book_by_id
    @book = Book.find(params[:id])
  end

  def getting_book_params
    params.require(:book).permit(:title, :author)
  end
end