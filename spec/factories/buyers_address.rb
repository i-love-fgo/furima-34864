FactoryBot.define do
  factory :buyer_address do
    postal_code   {'123-4567'}
    area_id       {2}
    municipality  {'東京都'}
    house_number  {'1-1'}
    phone_number  {'09012345678'}
    item_id       {'3'}
  end
end
