class Tweet < ApplicationRecord
  belongs_to  :user
  has_many  :favorites,  dependent: :destroy
  has_many  :favorited_users, through: :favorites,  source: :user
  has_many  :comments,  dependent: :destroy
  has_many  :tweet_images
  
  accepts_nested_attributes_for :tweet_images, allow_destroy: true
  mount_uploader :image, ImageUploader

  validates :text, presence: true, unless: :image?
end