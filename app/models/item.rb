class Item < ApplicationRecord
  attachment :image
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
