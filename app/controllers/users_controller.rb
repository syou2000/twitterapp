class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :usericon, :header__image, :profile, :user)
  end
end