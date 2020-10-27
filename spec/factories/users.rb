FactoryBot.define do
  factory :user do
    # nickname                {Faker::Name.name}
    email                   {Faker::Internet.email}
    password                {Faker::Internet.password(min_length: 6,mix_case: true)}
    password_confirmation   {password}
    # last_name               
    # first_name
    # last_name_ruby
    # first_name_ruby
    birthday                {Faker::Date.between(from: '1930-01-01', to: 5.year.ago)}
  end
end