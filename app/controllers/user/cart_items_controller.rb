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
  @cart_item.update(cart_item_params)
  @cart_items = current_user.cart_items
  redirect_to user_cart_items_path
 end
 
 def destroy
 
 end
 
 private
 def cart_item_params
  params.permit(:product_id,:user_id ,:amount)
 end
end
