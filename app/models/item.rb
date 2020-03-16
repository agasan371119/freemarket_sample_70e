class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :item_images
  # has_many :comments
  # has_many :reviews
  # has_one :delivery
end
