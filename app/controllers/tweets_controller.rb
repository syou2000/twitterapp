class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
  end

  # private
  # def tweet_params
  #   params.require(:tweet).permit(:text, :image, :user_id)
end