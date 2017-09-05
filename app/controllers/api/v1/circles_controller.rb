class Api::V1::CirclesController < ApplicationController
  def index
    @circles = Circle.all
    if params[:user_id]
      @select_circles = User.find(params[:user_id]).circles
      render json: @select_circles
    else
      render json: @circles
    end
  end

  def create
    @circle = Circle.create(user_params)
    render json: @circle
  end

  def update
    @circle = Circle.find(params[:id])
    @circle.update(user_params)
    render json: @circle
  end

  def show
    @circle = Circle.find(params[:id])
    render json: {circle: @circle, supporters: @circle.supporters}
  end

  def destroy
    @circle = Circle.find(params[:id])
    @circles = Circle.all
    @circle.destroy
    render json: @circles
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :fellowship_id, :user_id)
  end
end
