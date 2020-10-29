FactoryBot.define do
  factory :item_trade do
    token               { "tok_abcdefghijk00000000000000000" }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    postal_code         { "123-4567" }
    prefecture_id       { Faker::Number.between(from: 1, to: 47) }
    city                { Faker::Address.city }
    address_number      { Faker::Address.building_number }
    building            { Faker::Lorem.word }
    phone_number        { Faker::Number.leading_zero_number(digits:11) }
  end
end
