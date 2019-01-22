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

      coupons.each do |coup_i|
          key = coup_i[:item]
          if cart.has_key?(key)
            cart_int = cart[key][:count]
            coup_int = coup_i[:num]
            non_dis = cart_int % coup_int
              if non_dis == 0
                discount = cart_int
              else
                discount = cart_int / coup_int
              end
            new_cart[key][:count] = non_dis
            new_cart["#{key} W/COUPON"] = {price: coup_i[:cost],
                                      clearance: cart[key][:clearance],
                                      count: discount}
          end
      end
  new_cart
  binding.pry
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
