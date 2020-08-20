class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details

	enum status:{ waitingforpayment: 0, confirmpayment: 1, makingitem: 2, prepareshipment: 3, confitmedshipment: 4 }, _prefix: true

	def total_price
		order_details.to_a.sum { |item| item.total_price }
	end




end
