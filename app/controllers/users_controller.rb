class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
  end

  def edit
    @user = current_user
    @image = @user.usericon
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :usericon, :profile)
  end
end