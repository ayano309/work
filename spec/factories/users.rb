# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  address                :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  first_name_kana        :string           not null
#  last_name              :string           not null
#  last_name_kana         :string           not null
#  phone_number           :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  zip_code               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
