module ApplicationHelper
	def taxprice(price)
		(price * 1.1).ceil
	end
end
