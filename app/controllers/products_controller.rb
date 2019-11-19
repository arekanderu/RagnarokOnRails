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

    # @search = params['search']
    # if @search.present?
    #   @name = @search['name']
    #   @products = Product.where('name LIKE ?', "%#{@name}%")
    # end
    @search_results = @products.paginate(page: params[:page], per_page: 5)

    @query = params[:query]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results;
  end
end
