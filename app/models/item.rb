class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_time

  has_one_attached :image

  validates :item_name,          presence: true
  validates :info, :text,        presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence: true
end
