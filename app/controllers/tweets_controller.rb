class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
    @user = current_user
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: '投稿に成功しました！'
    end
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end
end