class PurchaseRecord < ApplicationRecord
  has_one :delivery_address
  belongs_to :item
  belongs_to :user
end
