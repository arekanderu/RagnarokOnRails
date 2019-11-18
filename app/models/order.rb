class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :products, through: :order_details

  validates :order_number, :customer, :order_date, presence: true
  validates :order_number, numericality: { only_integer: true }

end
