class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/.freeze

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6}, format: { with: PASSWORD_REGEX, message: '6文字以上半角英数字で入力してください'}
  validates :last_name, :first_name, presence: true, format: { with: NAME_REGEX, message: '全角文字を使用してください' }
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX, message: 'カタカナを使用してください' }
  validates :birth_date, presence: true
end
