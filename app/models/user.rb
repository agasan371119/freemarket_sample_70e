class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options if: :user_signed_in? do |user|
    user.validates :nickname, presence: true
    # user.validates :email, presence: true
    # user.validates :encrypted_password, presence: true
    user.validates :familyname, presence: true
    user.validates :firstname, presence: true
    user.validates :familyname_kana, presence: true
    user.validates :firstname_kana, presence: true
    user.validates :furigana, presence: true
    user.validates :birth_year, presence: true
    user.validates :birth_month, presence: true
    user.validates :birth_day, presence: true
    user.validates :introduction, presence: true
    user.validates :image, presence: true
  end

  has_many :reviews
  has_many :images
  has_many :items
  has_many :comments
  has_many :likes
  has_many :points
  has_many :profits
  has_one :credit_card
  has_one :address
end
