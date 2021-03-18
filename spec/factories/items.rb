FactoryBot.define do
  factory :item do
    item_name         {'test'}
    item_description  {'ttt'}
    category_id       {'2'}
    status_id         {'2'}
    delivery_id       {'2'}
    area_id           {'2'}
    duration_id       {'2'}
    selling_price     {'500'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
