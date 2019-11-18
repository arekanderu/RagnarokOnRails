class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details

  validates :category, :name, :number_in_stock, :attack, :price, presence: true
  validates :number_in_stock, :attack, numericality: { only_integer: true }
end
