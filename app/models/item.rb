class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :postage
  belongs_to_active_hash :day
  belongs_to_active_hash :status
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :item_images, presence: true
  validates :name, presence: true, length: { maximum: 40}
  validates :description, presence: true, length: { maximum: 1000}
  validates :category_id, :status_id, :postage_id, :prefecture_id, :day_id, presence: true
  validates :price,presence: true,numericality: {only_integer: true,greater_than: 299, less_than: 10000000}
end

 