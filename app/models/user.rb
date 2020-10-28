class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name_ruby, format: { with: /\A[ァ-ン]+\z/ }
    validates :last_name_ruby, format: { with: /\A[ァ-ン]+\z/ }
    validates :birthday
  end
  validates :password, format: { with: /[a-z]{1,}/i }
  validates :password, format: { with: /[0-9]{1,}/ }
  has_many :items
  has_many :trades
end
