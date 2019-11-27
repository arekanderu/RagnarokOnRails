# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @products =
      if params[:option] == 'New'
        Product.order('created_at DESC, category_id')

      elsif params[:option] == 'Updated'
        Product.order('updated_at DESC, category_id')

      else
        Product.all
      end

    @paginate_results = @products.paginate(page: params[:page], per_page: 5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    flash[:notice] = ''

    if params[:product][:category_id].present? && params[:query].present?
      flash[:notice] = 'No search result.'
      @query = params[:query]
      @category = params[:product][:category_id]
      @products = Product.where('category_id=? and lower(name) LIKE ? ', @category.to_s, "%#{@query}%")

    elsif params[:query].present?
      flash[:notice] = 'No search result.'
      @query = params[:query]
      @products = Product.where('name LIKE ?', "%#{@query}%")

    elsif params[:product][:category_id].present?
      @category = params[:product][:category_id]
      @products = Product.where('category_id=? ', @category.to_s)

    else
      flash[:notice] = 'No search result.'
    end
  end

  def add_to_cart
    id = params[:id].to_i
    @query = params[:query].to_i

    session[:cart] << { id: id, quantity: @query } unless session[:cart].include?(id)

    redirect_to root_path
  end

  def load_cart
    @cart = Product.find(session[:cart].map { |hash| hash['id'] } )
    @quantity = session[:cart].map { |hash| hash['quantity'] }
  end

  def remove_from_cart
    id = params[:id].to_i
    @query = params[:query].to_i

    session[:cart].delete_if { |hash| hash['id'] == id }
    #redirect_to root_path
  end

  def edit_the_cart
    id = params[:id].to_i
    # quantity = params[:quantity].to_i

    # session[:quantity].update => quantity)
    redirect_to root_path
  end

  private

  def initialize_session
    session[:cart] ||= []
  end
end
