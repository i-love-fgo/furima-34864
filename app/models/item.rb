class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :selling_price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :duration
  validates :category_id, numericality: { other_than: 1}
  validates :status_id, numericality: { other_than: 1}
  validates :delivery_id, numericality: { other_than: 1}
  validates :area_id, numericality: { other_than: 1}
  validates :duration_id, numericality: { other_than: 1}
end
