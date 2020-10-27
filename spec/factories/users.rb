FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation   { password }
    last_name               { Gimei.last }
    first_name              { Gimei.first }
    last_name_ruby          { last_name.katakana }
    first_name_ruby         { first_name.katakana }
    birthday                { Faker::Date.between(from: '1930-01-01', to: 5.year.ago) }
  end
end
