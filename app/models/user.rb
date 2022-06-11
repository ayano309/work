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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ } 
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }  # 電話番号(ハイフンなし10桁or11桁)
  validates :zip_code,presence: true, format: { with: /\A\d{7}\z/ }   # 郵便番号（ハイフンなし7桁）
  
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
 has_many :addresses, dependent: :destroy
 
 
  
end
