class ListsController < ApplicationController
  def new
    @list = List.new 
  end

  def create
     @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
    # １. データを受け取り新規登録するためのインスタンス作成
    # 2. データをデータベースに保存するためのsaveメソッド実行
    # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
    flash[:notice] = "投稿が成功しました"
  end
  
  def index
     @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト  
  end
  
   private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
