class Item < ApplicationRecord
	belongs_to :genre
	attachment :image
	has_many :order_details
	has_many :cart_items, dependent: :destroy

	def total_price
		price * amount
	end
end
