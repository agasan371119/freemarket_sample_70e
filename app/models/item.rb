class Item < ApplicationRecord
  has_many :likes
  has_many :item_images
  # has_many :comments
  # has_many :reviews
  # has_one :delivery
  # belongs_to :category
  # belongs_to :user

end
