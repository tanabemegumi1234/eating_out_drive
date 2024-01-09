class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) #データを受け取り新規登録するためのインスタンス作成
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def index

  end
  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:image, :name, :introduction)
  end
end
