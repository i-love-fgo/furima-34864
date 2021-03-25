FactoryBot.define do
  factory :buyer_address do
    postal_code   {'123-4567'}
    area_id       {2}
    municipality  {'東京都'}
    house_number  {'1-1'}
    phone_number  {'09012345678'}
    token         {'tok_abcdefghijk00000000000000000'}
  end
end
