class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text,:user_id)
  end
end