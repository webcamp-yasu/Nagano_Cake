class Address < ApplicationRecord
	#belongs_to :customer

	validates :name, presence: true
	validates :Address, presence: true
	validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
end
