class Public::UsersController < ApplicationController
  def show
    @user = current_user #現在のユーザー
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

  private
  def user_params
    params.require(:user).permit(:full_name, :furigana, :email, :encrypted_password, :telephone_number, :login_name )
  end
end