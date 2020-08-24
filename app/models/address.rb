class Address < ApplicationRecord

  belongs_to :customer

	validates :name, presence: true
	validates :address, presence: true
	validates :postal_code, length: {is: 7}, numericality: {only_integer: true}

  #注文情報入力ページで利用する
  def order_address
    self.postal_code + self.address + self.name
  end

end
