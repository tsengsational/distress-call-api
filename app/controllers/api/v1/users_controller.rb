class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    circles = @user.circles
    circles_json = circles.map { |circle| {circle: circle, supporters: circle.supporters} }
    render json: {user: @user, circles: circles_json}
  end

  def create
    @user = User.new(username: params[:username], first_name: params[:first_name], last_initial: params[:last_initial], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      render json: @user
    else
      render json: { message: "User not created"}
    end
  end

  def destroy
    @user = User.find(paramd[:id])
    @users = User.all
    @user.destroy
    render json: @users
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_initial, :phone)
  end
end
