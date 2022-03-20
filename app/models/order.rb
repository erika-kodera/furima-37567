class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities,
                :house_number, :building_name, :phone_number, :purchase_record_id, :token

  with_options presence: true do
  validates :user_id
  validates :item_id 
  validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/, message: "半角数字を使用してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities
  validates :house_number
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "半角数字を使用してください" }
  validates :token
end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, 
      municipalities: municipalities, house_number: house_number, phone_number: phone_number, building_name: building_name, 
      purchase_record_id: purchase_record.id)
  end
  
end