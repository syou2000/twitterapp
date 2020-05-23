class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      # flash.now[:alert] = '入力に誤りがあります'
      # render action: :index
    end
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end
end