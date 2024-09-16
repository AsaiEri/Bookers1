class BooksController < ApplicationController
  def top
  end
  def new
    @list = Book.new 
  end

  def create
     @list = Book.new(book_params)
    if @list.save
      redirect_to book_path(@list.id)
    else
      @lists = Book.all
      render :index
    end
    # １. データを受け取り新規登録するためのインスタンス作成
    # 2. データをデータベースに保存するためのsaveメソッド実行
    # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
    flash[:notice] = "投稿が成功しました"
  end
  
  def index
     @lists = Book.all
     @list = Book.new 
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end
  
  def destroy
    list = Book.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  def update
    @list = Book.find(params[:id])
    if @list.update(book_params)
      redirect_to book_path(@list.id)  
    else
        render :edit
    end
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
