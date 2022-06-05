class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user



  scope :set_user_cart, -> (user) { user_cart = where(user_id: user.id)&.last
    user_cart.nil? ? CartItem.create(user_id: user.id) : user_cart}
	scope :user_cart_items, -> (user_shoppingcart) {where(user_id: user_shoppingcart)}


  def add_item(item)
		current_item = CartItem.find_by(product_id: product.id)
		if current_item
			current_item.amount+= amount
		else
			current_item = cart_items.new(product_id: product.id)
		end
		current_item
	end
end
