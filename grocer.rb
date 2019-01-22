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
    cart.each do |cart_key, cart_val|
      new_cart[cart_key] = {}
      coupons.each do |coup_i|
          key = coup_i[:item]
          if cart_key == key
            cart_int = cart_val[:count]
            coup_int = coup_i[:num]
            non_dis = cart_int % coup_int
            discount = cart_int / coup_int

            new_cart[key][:count] = non_dis
            new_cart["#{key} W/COUPON"] = {price: coup_i[:cost],
                                      clearance: cart[key][:clearance],
                                      count: discount}
          else
            new_cart[cart_key] = cart_val
          end
      end
    end
  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
