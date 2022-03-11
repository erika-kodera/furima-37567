FactoryBot.define do
  factory :item do
    item_name             { Faker::Lorem }
    info                  { Faker::Lorem.paragraph(sentence_count = 3) }
    category_id           { Category.all.sample }
    condition_id          { Condition.all.sample }
    shipping_charge_id    { ShippingCharge.all.sample }
    prefecture_id         { Prefecture.all.sample }
    shipping_time_id      { ShippingTime.all.sample }
    price                 { Faker::Number.between(from: 300, to: 9999999) }
  end
end
