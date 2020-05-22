class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorited_tweets, through: :favorites,  source: :tweet
  has_many :relationships
  has_many :followings, through: :relationships,  source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASS_REGEX}
end
