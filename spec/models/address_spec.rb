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
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
