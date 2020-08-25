class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details

    enum payment_method:{"クレジットカード": 0, "銀行振込": 1}
    enum status:{ waitingforpayment: 0, confirmpayment: 1, makingitem: 2, prepareshipment: 3, confitmedshipment: 4 }
end
