class Item < ApplicationRecord
	belongs_to :genre

	has_many :cart_items
	has_many :order_details
	has_many :orders, through: :order_details

	attachment :image

	def total_price
		price * amount
	end

end