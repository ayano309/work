class Dashboard::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "注文ステータスの変更しました"
    redirect_to dashboard_orders_path
  end
  
  
  
  private 
  def order_params
    params.require(:order).permit(:order_status)
  end
end
