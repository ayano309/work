class User::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_user
   
  def show
   
  end

  def edit
  
  end

  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user)
    else
      flash[:notice] = "入力内容に誤りがあります"
      render :edit
    end
  end
  
  def destroy
    # ユーザーが退会処理をするとき
    @user.deleted_flg = User.switch_flg(@user.deleted_flg)
    @user.update(deleted_flg: @user.deleted_flg)
    redirect_to root_path
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :zip_code, :address, :phone_number, :deleted_flg)
  end
end
