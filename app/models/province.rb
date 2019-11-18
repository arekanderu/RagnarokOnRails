class Province < ApplicationRecord
  has_one :customer

  validates :name, presence: true
  validates :name, length: { maximum: 2 }
end
