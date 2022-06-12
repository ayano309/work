class Dashboard::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"
   
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  
  def edit
     @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_user_path(@user), notice: '会員情報が更新されました'
    else
      render :edit
    end
  end
   # ユーザーの退会処理
  def destroy
    user = User.find(params[:id])
    #switch_flgメソッドは、与えられた引数によってtrueまたはfalseを返す。
    deleted_flg = User.switch_flg(user.deleted_flg)
    user.update(deleted_flg: deleted_flg)
    redirect_to dashboard_users_path
  end


  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email, :deleted_flg)
  end

end
 
