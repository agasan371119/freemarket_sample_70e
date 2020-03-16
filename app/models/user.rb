class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :familyname, :firstname, :birth_year, :birth_month, :birth_day, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
              format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "メールアドレスを入力してください" }
  validates :password, presence: true, length: { minimum: 7 }, 
              format: { with: /\A[a-z0-9]+\z/i, message: "パスワードを入力してください" }
  validates :familyname_kana, :firstname_kana, presence: true, 
              format: { with: /\A([ァ-ン]|ー)+\z/, message: "全角で入力してください" }

  # validates :nickname, :firstname, :lastname, :birthday, presence: true
  #             {message: "ニックネームを入力してください" }
  # validates :email, presence: true, uniqueness: { case_sensitive: false }, 
  #               format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "メールアドレスを入力してください" }
  # validates :encrypted_password, presence: true, length: { minimum: 7 }, 
  #             format: { with: /\A[a-z0-9]+\z/i, message: "パスワードを入力してください" }
  # validates :familyname, presence: true, {message: "姓 を入力してください" }
  # validates :firstname, presence: true, {message: "名 を入力してください" }
  # validates :kana_firstname, presence: true, 
  #             format: { with: /\A([ァ-ン]|ー)+\z/, message: "姓カナ を入力してください" }
  # validates :kana_lastname, presence: true, 
  #             format: { with: /\A([ァ-ン]|ー)+\z/, message: "名カナ を入力してください" }
  # validates :birth_year, :birth_month, :birth_day, presence: true, {message: "生年月日を入力してください" }
    
  

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
