class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details

	enum status:{ waitingforpayment: 0, confirmpayment: 1, makingitem: 2, prepareshipment: 3, confitmedshipment: 4 }, _prefix: true
	enum payment_method:{ creditcard: 0, banktransfer: 1 }, _prefix: true

end
