class UsersController < ApplicationController

  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to user_path(@user)
  end

  def show
    @user = User.friendly.find(params[:slug])
  end

  def edit
    @user = User.friendly.find(params[:slug])
  end
  def update
    user = User.find(params[:slug])
    user.update_attributes(user_update_params)
    if user.save
      redirect_to user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :current_city,:email, :password_digest, :image)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :current_city, :email, :image)
  end

end
