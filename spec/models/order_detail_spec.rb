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
require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
