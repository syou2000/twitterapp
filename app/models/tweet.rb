class Tweet < ApplicationRecord
  belongs_to  :user
  has_many  :favorites,  dependent: :destroy
  has_many  :favorited_users, through: :favorites,  source: :user
  has_many  :comments,  dependent: :destroy
  has_one_attahed  :tweet_image,  dependent: :destroy

  attr_accessor :image
end
