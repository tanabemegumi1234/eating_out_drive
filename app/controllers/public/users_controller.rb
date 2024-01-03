class Public::UsersController < ApplicationController
  def show
    @user = current_user #現在のユーザー
  end

  def edit
    @user = current_user
  end
end
