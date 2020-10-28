FactoryBot.define do
  factory :item do
    association :user
    name                  { Faker::Name.name }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    state_id              { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id    { Faker::Number.between(from: 2, to: 3) }
    delivery_area_id      { Faker::Number.between(from: 1, to: 47) }
    day_id                { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |test|
      test.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'test_image.png')
    end
  end
end
