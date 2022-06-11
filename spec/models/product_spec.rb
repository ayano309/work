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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
