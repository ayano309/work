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
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
