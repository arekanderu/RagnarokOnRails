class OrdersController < ApplicationController
  def index
    @orders = Order.all

    if session[:order_id]
      Order.find(session: order_id)
    else
      Order.new
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
