# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  description  :text             default("商品説明"), not null
#  name         :string           not null
#  price        :integer          not null
#  soldout_flag :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer          not null
#
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
