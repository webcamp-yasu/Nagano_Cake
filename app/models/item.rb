class Item < ApplicationRecord
	def taxprice(price)
		price * 1.1
	end
end
