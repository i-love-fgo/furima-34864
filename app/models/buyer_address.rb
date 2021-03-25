class BuyerAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end