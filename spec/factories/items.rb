FactoryBot.define do
  factory :item do
    association :user
    item_name             { Faker::Coffee.origin }
    info                  { Faker::Lorem.sentence }
    category_id           { 2 }
    condition_id          { 4 }
    shipping_charge_id    { 3 }
    prefecture_id         { 24 }
    shipping_time_id      { 4 }
    price                 { Faker::Number.between(from: 300, to: 9999999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/omelette.png'), filename: 'omelette.png')
    end
  end
end
