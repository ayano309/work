# == Schema Information
#
# Table name: order_details
#
#  id                 :integer          not null, primary key
#  amount             :integer          not null
#  production_status  :integer          default("ηζδΈε―"), not null
#  tax_included_price :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  order_id           :integer          not null
#  product_id         :integer          not null
#
FactoryBot.define do
  factory :order_detail do
    
  end
end
