class Public::UsersController < ApplicationController
  def show
    @user = current_user #現在のユーザー
    @posts = @user.post
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path(@user), notice: "情報が更新されました。"
    else
      render :edit
    end
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true) # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    reset_session #セッション情報を全て削除します。
    flash[:notice] = "退会処理が完了いたしました。"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :furigana, :email, :encrypted_password, :telephone_number, :login_name, :profile_image )
  end
end