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
FactoryBot.define do
  factory :product do
    
  end
end
