class Api::V1::SupportersController < ApplicationController
  def index
    @supporters = Supporter.all
      render json: @supporters
  end

  def create
    if @supporter = Supporter.find_by(phone: params[:supporter][:phone])
      circle = Circle.find(params[:circle_id])
      circle.supporters << @supporter
      render json: {supporter: @supporter, circle: circle}
    else
      @supporter = Supporter.create(supporter_params)
      circle = Circle.find(params[:circle_id])
      circle.supporters << @supporter
      render json: {supporter: @supporter, circle: circle}
  end
  end

  def update
    @supporter = Supporter.find(params[:id])
    @supporter.update(supporter_params)
    render json: @supporter
  end

  def show
    @supporter = Supporter.find(params[:id])
    render json: @supporter
  end

  def remove
    @supporter = Supporter.find(params[:supporterID])
    circle = Circle.find(params[:circleID])
    supporter_circle = @supporter.supporter_circles.find_by(circle_id: params[:circleID])
    supporter_circle.destroy
    render json: {supporter: @supporter, circle: circle}
  end

  def destroy
    @supporter = Supporter.find(params[:id])
    @supporter.destroy
    render json: {response: "Supporter destroyed"}
  end

  private

  def supporter_params
    params.require(:supporter).permit(:first_name, :last_initial, :phone)
  end
end
