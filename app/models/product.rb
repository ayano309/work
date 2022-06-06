class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  has_one_attached :image
## 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
end
