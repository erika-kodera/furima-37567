FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '山田' }
    last_name             { '花子' }
    family_name_kana      { 'ヤマダ' }
    last_name_kana        { 'ハナコ' }
    birth_day             { '2022/3/9' }
  end
end
