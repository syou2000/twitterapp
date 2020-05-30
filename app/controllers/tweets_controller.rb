class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
    @user = current_user
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    end
  end

  def explore
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
  end
  
  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end
end