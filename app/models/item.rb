class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_time

  has_many_attached :images
  has_one :purchase_record

  validates :images, presence: true
  validates :item_name,          presence: true, length: { maximum: 40 }
  validates :info,               presence: true, length: { maximum: 1000 }
  validates :category_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_time_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: '半角数字で¥300〜¥9,999,999で設定してください' }
  end
end
