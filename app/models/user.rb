class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6}, format: { with: PASSWORD_REGEX }
  validates :last_name, :first_name, presence: true, format: { with: NAME_REGEX }
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :birth_date, presence: true
end
