class BooksController < ApplicationController

  # 一覧
  def index
  	@books = Book.all
  end

  # 詳細
  def show
  	@book = Book.find(params[:id])
  end

  # 新規作成画面
  def new
   @book = Book.new
  end

  # 編集
  def edit
  	@book = Book.find(params[:id])
  end

  # 新規作成
  def create
  	@book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "登録しました。"
    else
      render "new"
    end
  end

  # 更新
  def update
  	@book = Book.find(params[:id])
    @book.assign_attributes(member_params)
    if @book.save
      redirect_to @book, notice: "更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def delete
  	Book.find(params[:id]).destroy
  	redirect_to @book
  end

  private

  # ストロングパラメーター
  def book_params
  	params.require(:book).permit(
  		:title,
  		:author,
  		:price,
  		:publisher,
  		:memo)
  end

end
