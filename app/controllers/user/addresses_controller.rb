class User::AddressesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @addresses = current_user.addresses
    @address = current_user.addresses.new
    
  end
  
  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
     redirect_to user_addresses_path, notice: '新規配送先を登録しました'
    else
      flash.now[:error] = '登録に失敗しました'
      @addresses = current_user.addresses
      render :index
    end
    
  end
  
  def edit
    @address = current_user.find(params[:id])
  end
  
  def update
    @address = current_user.find(params[:id])
     if @address.update(address_params)
      redirect_to user_addresses_path, notice: '配送先を変更しました'
    else
      flash.now[:error] = '変更に失敗しました'
      render :edit
    end
  end
  
  def destroy
    address = current_user.find(params[:id])
    address.destroy!
    redirect_to user_addresses_path, notice: '削除しました'
  end
  
  private
  
  def address_params
    params.require(:address).permit(:zip_code, :address, :name)
  end
  
end
