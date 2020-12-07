class Item < ApplicationRecord
  has_many :order_details
  has_many :cart_items
  belongs_to :genre
  attachment :image
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
