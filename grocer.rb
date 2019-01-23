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
  new_cart = {}
  cart_int, coup_int, discount, non_dis = 0, 0, 0, 0
  new_price = 0.0
    cart.each do |cart_key, cart_val|
      new_cart[cart_key] = cart_val
      cart_int = cart_val[:count]
        coupons.each do |coup_i|
          if cart_key == coup_i[:item]
            binding.pry
            coup_int += coup_i[:num]
            discount += 1
            new_price = coup_i[:cost]
          end
        end
      binding.pry
      non_dis = cart_int % coup_int
      new_cart[cart_key] = {price: cart_val[:price],
                                clearance: cart[cart_key][:clearance],
                                count: non_dis}

      new_cart["#{cart_key} W/COUPON"] = {price: new_price,
                                clearance: cart[cart_key][:clearance],
                                count: discount}

    end
  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
