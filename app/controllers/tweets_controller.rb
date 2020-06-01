class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
    @user = current_user
    twt = Tweet.find_by(params[:id])
    @usera = User.find_by(id: twt.user_id)
  end

  def create
    @tweet = Tweet.new
    Tweet.create(
      tweet_params
    )
    redirect_to root_path

  end

  def destroy
    @twt = Tweet.find_by(params[:id])
    if @twt.destroy
      redirect_to root_path
    end
  end

  def explore
    twt = Tweet.find_by(params[:id])
    @usera = User.find_by(id: twt.user_id)
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
  end

  def search
    @user = current_user
    twt = Tweet.find_by(params[:id])
    @usera = User.find_by(id: twt.user_id)
    if params[:keyword] == ""
      redirect_to root_path
    else
      @tweets = []
      @keyword = params[:keyword].split(/[[:blank:]]+/)
      @tweets = Tweet.where('text LIKE(?)', "%#{@keyword[0]}%")
      if @keyword[1].present?
        @tweets = @tweets.where('text LIKE(?)', "%#{@keyword[1]}%")
      end
      if @keyword[2].present?
        @tweets = @tweets.where('text LIKE(?)', "%#{@keyword[2]}%")
      end
      if @keyword[3].present?
        @tweets = @tweets.where('text LIKE(?)', "%#{@keyword[3]}%")
      end
      if @keyword[4.. -1].present?
        @keyword.slice!(4..-1)
      end
      @tweets.uniq
    end
  end
  
  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:id, :name, :usericon, :header__image, :profile, :user)
  end

end