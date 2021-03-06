# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  amount     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer          not null
#  user_id    :integer          not null
#
class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user


end
