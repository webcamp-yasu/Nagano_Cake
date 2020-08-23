class Item < ApplicationRecord

	belongs_to :genre

	has_many :order_details
	has_many :cart_items

  attachment :image

	def total_price
		price * amount
	end
end
