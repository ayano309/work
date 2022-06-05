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
 
 ##合計金額
  def cart_items_total
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal
    end
    total
  end
end
