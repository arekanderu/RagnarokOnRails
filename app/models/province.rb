class Province < ApplicationRecord
  has_one :customer

  validates :name, :acronym, presence: true
  validates :acronym, length: { maximum: 2 }
end
