class Item < ApplicationRecord
  belongs_to :user
   :buyer
  def user
    return User.find_by(id: self.user_id)
  end
  
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
  end
  validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :duration
  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :duration_id
  end
end
