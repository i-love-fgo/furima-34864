FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.email }
    password              {'111qqq'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-01-01'}
  end
end