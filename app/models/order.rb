class Order < ApplicationRecord
  enum payment_method: [ :creditcard, :banktransfer ]
  enum status: [ :waiting, :confirm, :making, :preparation, :complete ]
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :sipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
end
