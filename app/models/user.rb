class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items 
  has_many :purchase_records
  
  validates :nickname, presence: true

  validates :family_name, presence: true, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, presence: true, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  validates :family_name_kana, presence: true, with: /\A[ァ-ヴー]+\z/u
  validates :last_name_kana, presence: true, with: /\A[ァ-ヴー]+\z/u

  validates :birth_day, presence: true
end
