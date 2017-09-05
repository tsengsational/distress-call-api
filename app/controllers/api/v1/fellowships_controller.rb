class Api::V1::FellowshipsController < ApplicationController
  def index
    @fellowships = Fellowship.all
    render json: @fellowships
  end

  def create
    @fellowship = Fellowship.create(user_params)
    render json: @fellowship
  end

  def update
    @fellowship = Fellowship.find(params[:id])
    @fellowship.update(user_params)
    render json: @fellowship
  end

  def show
    @fellowship = Fellowship.find(params[:id])
    render json: @fellowship
  end

  def destroy
    @fellowship = Fellowship.find(params[:id])
    @fellowships = Fellowship.all
    @fellowship.destroy
    render json: @fellowships
  end

  private

  def fellowship_params
    params.require(:fellowship).permit(:name, :description)
  end
end
