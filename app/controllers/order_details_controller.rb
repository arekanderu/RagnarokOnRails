class OrderDetailsController < ApplicationController
  def cart
    if session[:order_id]
      Order.find(session: order_id)
    else
      Order.new
    end
  end
end