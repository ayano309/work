class User::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order = current_user.orders.new
    @addresses = current_user.addresses
  end

  def confirm
    @order = Order.new(
      user: current_user,
      pay_method: params[:order][:pay_method]
    )

    # カートアイテムの情報
    @cart_items = current_user.cart_items

    if params[:order][:user_address] = 1
      @order.zip_code = current_user.zip_code
      @order.address = current_user.address
      @order.name = current_user.last_name + current_user.first_name
    elsif params[:order][:user_address] = 2
      @address = current_user.addresses.find(params[:Address][:select_id])
      @order.zip_code = @address.zip_code
      @order.address = @address.address
      @order.name = @address.name
    elsif
      current_user.addresses.create!(
        zip_code: @order.zip_code,
        address: @order.address,
        name: @order.name
        )
    end
  end


  def create
    @order = current_user.orders.new(order_params)
    @order.save

    #注文履歴に移動
    @cart_items = current_user.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.product_id = cart_item.product_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.tax_included_price = cart_item.product.with_tax_price * cart_item.amount
      @order_detail.save
    end
    # 最後にカート商品を全て削除する
    @cart_items.destroy_all
    redirect_to user_thanks_path

  end

  #ありがとうのページ
  def thanks
  end

  

  private
 
  def order_params
    params.require(:order).permit(:pay_method,:zip_code,:address,:name,:total_price)
  end

end
