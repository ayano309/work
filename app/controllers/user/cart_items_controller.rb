class User::CartItemsController < ApplicationController
 before_action :authenticate_user!

 def index
  @cart_items = current_user.cart_items
 end

 def create
  @cart_item = current_user.cart_items.new(cart_item_params)
  @current_cart_item = CartItem.find_by(product: @cart_item.product)
  if @current_cart_item.present? and @cart_item.valid?
   @cart_item.amount += @current_cart_item.amount
   @current_cart_item.destroy
  end
  @cart_item.save
  redirect_to user_cart_items_path
 end


 def update
  @cart_item = current_user.cart_items.find(params[:id])
  if @cart_item.update(amount:params[:cart_item][:amount].to_i)
   redirect_to user_cart_items_path, success: '変更が完了しました'
  else
   flash.now[:error] = '更新に失敗しました'
   @cart_items = current_user.cart_items
   render :index
  end
 end

 def destroy
  cart_item = CartItem.find(params[:id])
  if cart_item.destroy
    flash[:notice] = "カート内の商品を削除しました。"
    redirect_to user_cart_items_path
  else
    @cart_items = current_user.cart_items
    render :index
  end
 end

 def all_destroy
  @cart_items = current_user.cart_items
  if @cart_items.destroy_all
   flash[:notice] = "カートを空にしました。"
   redirect_to  user_cart_items_path
  else
   @cart_items = current_user.cart_items
   render :index
  end

 end

 private
 def cart_item_params
  params.permit(:product_id,:user_id ,:amount)
 end
end
