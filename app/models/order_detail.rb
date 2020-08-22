class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :item

	enum production_status:{ new: 0, waiting: 1, working: 2, done: 3 }, _prefix: true


	def total_item_price
		item.price * amount
	end


end
