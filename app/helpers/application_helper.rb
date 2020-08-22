module ApplicationHelper

  def full_name(customer)
    "#{customer.last_name} #{customer.first_name}"
  end

  def full_name_kana(customer)
    "#{customer.last_name_kana} #{customer.first_name_kana}"
  end

  #税込価格
	def tax_price(price)
		(price * 1.1).ceil
	end

end
