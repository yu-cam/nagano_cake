class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer, -> { with_deleted }
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { waiting: 0, confirm: 1, maiking: 2, preparation: 3, complete: 4 }
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
end