class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.page(params[:page])
  end

  def create
    @post = current_user.post.new(post_params) #データを受け取り新規登録するためのインスタンス作成
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to posts_path(@post.id)
    else
      flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to users_my_page_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])  # データ（レコード）を1件取得
    post.destroy  # データ（レコード）を削除
    redirect_to users_my_page_path # 投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:image, :name, :introduction, :url, :parking, :profile_image)
  end
end