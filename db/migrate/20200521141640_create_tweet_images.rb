class CreateTweetImages < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_images do |t|
      t.string      :image, null: false
      t.references  :tweet, foreign_key: true
      
      t.timestamps
    end
  end
end