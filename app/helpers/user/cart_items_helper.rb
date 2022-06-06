module User::CartItemsHelper
  
  def subtotal(cart_item)
    cart_item.product.with_tax_price * cart_item.amount
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  subtotal(total)
    end
    return price
  end
end
