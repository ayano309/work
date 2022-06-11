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
FactoryBot.define do
  factory :cart_item do
    
  end
end
