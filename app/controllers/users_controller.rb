class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @followers = @user.followers
    @folowed = @user.followed_users
  end
end
