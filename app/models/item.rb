class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # has_many :comments
  # has_many :reviews
  # has_one :delivery
end
