# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products =

      if params[:product] && params[:product][:category_id]
        Product.search(params[:product][:category_id])

      elsif params[:option] == 'New'
        Product.order('created_at DESC, category_id')

      elsif params[:option] == 'Updated'
        Product.order('updated_at DESC, category_id')

      else
        Product.all
      end

    @search = params['search']
    @category = params['category_id']
    if @search.present?
      @name = @search['name']['category_id']
      @category = @search['category_id']
      @products = Product.where('name LIKE ?', "%#{@name}%")
    end

    @paginate_results = @products.paginate(page: params[:page], per_page: 5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    @query = params[:query]
    @products = Product.where('name LIKE ?', "%#{@query}%")

  end
end
