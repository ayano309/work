module ApplicationHelper
  def current_cart
    @cart_items = current_user.cart_items
  end


  def billing_amount(order)
    total_pay(current_cart) + order.postage
  end
end
