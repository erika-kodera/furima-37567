class DeliveryAddress < ApplicationRecord
  belongs_to :purchase_record
  belongs_to :prefecture


  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "半角数字を使用してください" }
  validates :prefectures_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :house_numbe, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "半角数字を使用してください" }

end
