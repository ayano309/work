class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user


## 小計を求めるメソッド
def subtotal
    product.with_tax_price * amount
end

def total
  subtotal += subtotal
end



end