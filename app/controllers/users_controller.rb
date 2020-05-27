class UsersController < ApplicationController

  # def show
  #   user = User.find(params[:id])
  # end

  def edit
    @user = User.find(params[:id])
    @tweets = Tweet.all.includes(:user).order(created_at: :desc)
    @user.update(user_params)
  end

  def update
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :usericon, :header, :profile)
  end
end