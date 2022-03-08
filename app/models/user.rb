class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items 
  has_many :purchase_records
  
  validates :nickname, presence: true, length: { maximum: 40 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :family_name, presence: true
  validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: '全角カナを使用してください' } do
  validates :family_name_kana, presence: true
  validates :last_name_kana, presence: true
  end
  validates :birth_day, presence: true
end
