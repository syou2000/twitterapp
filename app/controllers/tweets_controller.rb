class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
    @user = current_user
    twt = Tweet.find_by(params[:id])
    @usera = User.find_by(id: twt.user_id)
  end

  def create
    @tweet = Tweet.create(
      tweet_params,
      user_id: current_user.id
    )
    if @tweet.save
      redirect_to root_path
    end
  end

  def destroy
    @twt = Tweet.find_by(params[:id])
    if @twt.destroy
      redirect_to root_path
    end
  end

  def explore
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
  end
  
  private

  def tweet_params
    params.require(:tweet).permit(:text, :image)
  end

  def user_params
    params.require(:user).permit(:id, :name, :usericon, :header__image, :profile, :user)
  end

end