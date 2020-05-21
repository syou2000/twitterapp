class TweetImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to  :tweet,  optional: true

end
