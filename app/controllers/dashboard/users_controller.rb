class Dashboard::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"
   
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  # ユーザーの退会処理
  def destroy
    user = User.find(params[:id])
    #switch_flgメソッドは、与えられた引数によってtrueまたはfalseを返す。
    deleted_flg = User.switch_flg(user.deleted_flg)
    user.update(deleted_flg: deleted_flg)
    redirect_to dashboard_users_path
  end
end
