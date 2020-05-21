class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.integer  :user_id,  null:false
      t.string   :text,     null:false
      t.timestamps
    end
  end
end
