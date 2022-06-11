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
class Address < ApplicationRecord
  belongs_to :user
  
  def full_address
    '〒' + zip_code + ' ' + address + ' ' + name
end
end
