# spec/factories/order_payments.rb
FactoryBot.define do
  factory :order_payment do
    token { Faker::Internet.uuid }
    postcode { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    user_id { nil }
    item_id { nil }
  end
end
