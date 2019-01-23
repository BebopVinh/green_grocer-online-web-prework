require 'pry'

def consolidate_cart(cart)
  i = 0
  consol_cart = {}
  cart.each do |item|
    item.each do |key, stats|
      if consol_cart.has_key?(key)
        consol_cart[key][:count] += 1
      else
        consol_cart[key] = stats
        consol_cart[key][:count] = 1
      end
    end
  end
  consol_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item_name = coupon[:item]
    if cart[item_name] && cart[item_name][:count] >= coupon[:num]
      if cart["#{item_name} W/COUPON"]
        cart["#{item_name} W/COUPON"][:count] += 1
      else
        cart["#{item_name} W/COUPON"] = {price: coupon[:cost], count: 1, clearance: cart[item_name][:clearance]}
      end
      cart[item_name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |cart_item, item_value|
    if item_value[:clearance] == true
      item_value[:price] = (item_value[:price]*0.8).round(2)
    end
  end
  cart

end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  coupons_applied = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(coupons_applied)
  total_cost = 0.0
  final_cart.each_value do |cart_value|
    total_cost += (cart_value[:price] * cart_value[:count])
  end
  if total_cost > 100
    total_cost = total_cost - (total_cost*0.1)
  else
    total_cost
  end
end
