class User::OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end
  
  def show
    
  end
  
  def new
    @order = current_user.orders.new
    @addresses = current_user.addresses
  end
  
  def confirm
    @order = Order.new(order_params)
    binding.pry #追記する
  end

  
  def create
  
  end
  
  def edit 
    
  end
  
  def update
    
  end
  
  
  def destroy
    
  end
  
  private
  
  def order_params
    params.require(:order).(:pay_method,:zip_code,:address,:name)
  end
  
end
