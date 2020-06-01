class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @tweets = Tweet.where(user_id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    @tweets = Tweet.where(user_id: params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.update(user_params)
      redirect_to edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :usericon, :header__image, :profile, :user)
  end

end