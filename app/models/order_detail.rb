# == Schema Information
#
# Table name: order_details
#
#  id                 :integer          not null, primary key
#  amount             :integer          not null
#  production_status  :integer          default("着手不可"), not null
#  tax_included_price :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  order_id           :integer          not null
#  product_id         :integer          not null
#
class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  
  
 enum production_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}
end
