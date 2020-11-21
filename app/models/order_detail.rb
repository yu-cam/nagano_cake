class OrderDetail < ApplicationRecord
  enum maiking_status: [ :impossible, :waiting, :making, :complete ]
  validates :price, presence: true
  validates :amount, presence: true
end
