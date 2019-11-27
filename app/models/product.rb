# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details

  validates :category, :name, :number_in_stock, :price, presence: true
  validates :number_in_stock, :attack, :magic_attack, numericality: { only_integer: true }

  has_one_attached :image

  def thumbnail
      image.variant(resize:'90x90').processed
  end
end
