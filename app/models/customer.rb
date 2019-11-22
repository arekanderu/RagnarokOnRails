# frozen_string_literal: true

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province
  has_many :orders

  # validates :name, :email_address, :credit_card_number, presence: true
  # validates :email_address, :credit_card_number, uniqueness: true
  # validates :credit_card_number, :phone_number, numericality: { only_integer: true }
  # validates :credit_card_number, length: { maximum: 16 }
  # validates :phone_number, length: { maximum: 10 }
end
