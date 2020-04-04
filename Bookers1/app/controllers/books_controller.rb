class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:error] = 'Book was not created error'
      render 'index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if  book.update(book_params)
      flash[:success] = 'Book was successfully updated'
      redirect_to book_path(book.id)
    else
      flash[:error] = 'Book was not updated error'
      redirect_to book_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "登録が完了しました。"
      redirect_to books_path
      flash[:success] = 'Book was successfully destroyed'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
