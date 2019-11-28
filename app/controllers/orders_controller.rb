class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @cart = Product.find(session[:cart].map { |hash| hash['id'] })
    @quantity = session[:cart].map { |hash| hash['quantity'] }

  end
end