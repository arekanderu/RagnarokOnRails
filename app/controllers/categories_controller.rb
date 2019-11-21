# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:name)
  end

  def show
    @category = Category.find(params[:id])
  end
end
