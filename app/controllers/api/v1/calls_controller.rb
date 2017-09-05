class Api::V1::CallsController < ApplicationController
  def index
    @calls = Call.all
    render json: @calls
  end

  def create
    @call = Call.create(call_params)
    @call.send_call
    render json: {message: "DistressCall successively sent"}
  end

  def show
    @call = Call.find(params[:id])
    render json: @call
  end

  private

  def call_params
    params.require(:call).permit(:circle_id, :message)
  end

end
