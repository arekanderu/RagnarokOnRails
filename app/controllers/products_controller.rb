class ProductsController < ApplicationController
  def index
    @products =

    if params[:option] == 'New'
      Product.order('created_at DESC, category_id')

    elsif params[:option] == 'Updated'
      Product.order('updated_at DESC, category_id')

    else
      Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
