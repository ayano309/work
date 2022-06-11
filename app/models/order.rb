# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  address      :string           not null
#  name         :string           not null
#  order_status :integer          default("入金待ち"), not null
#  pay_method   :integer          default("クレジットカード"), not null
#  postage      :integer          default(800), not null
#  total_price  :integer          not null
#  zip_code     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  
  enum pay_method: {"クレジットカード": 0,"銀行振込": 1}
	enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

  
end
