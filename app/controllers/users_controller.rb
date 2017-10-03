class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.friendly.find(params[:slug])
    @graphs = @user.graphs
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :password, :image)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :image)
  end

end
