FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '小樽市' }
    house_number { '小樽123' }
    building_name { '小樽ビル123' }
    phone_number { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
