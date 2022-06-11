# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  address    :string           not null
#  name       :string           not null
#  zip_code   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
FactoryBot.define do
  factory :address do
    
  end
end
