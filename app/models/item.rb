class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  validates :image_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
