class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :encrypted_password, format: { with: /[a-z]{1,}/i }
  validates :encrypted_password, format: { with: /[0-9]{1,}/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_ruby, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :last_name_ruby, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
end
