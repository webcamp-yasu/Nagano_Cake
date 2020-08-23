module ApplicationHelper

  def full_name(customer)
    "#{customer.last_name} #{customer.first_name}"
  end

  def full_name_kana(customer)
    "#{customer.last_name_kana} #{customer.first_name_kana}"
  end

  def tax_price(price)#税込価格
	(price * 1.1).ceil
  end

  def sub_total(sub)#小計
  	((tax_price(sub.item.price)) * sub.amount)
  end

  def total_price(totals)#支払い金額
  	price = 0
  	totals.each do |total|
  		price += sub_total(total)
  	end
  	return price
  end

  def billing(order)
  	total_price(current_customer.cart_items) + order.postage
  end

end


