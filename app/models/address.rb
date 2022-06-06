class Address < ApplicationRecord
  belongs_to :user
  
  def full_address
    '〒' + zip_code + ' ' + address + ' ' + name
end
end
