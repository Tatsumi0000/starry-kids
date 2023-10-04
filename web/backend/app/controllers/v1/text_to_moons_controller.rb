class V1::TextToMoonsController < ApplicationController
  def index
    @result = Converter::TextToMoon.new(text: moon_params[:text], size: moon_params[:size]).call
    # TODO: ここでバリデーションの結果を良い感じに表示する
    render json: @result
  end

  private

  def moon_params
    params.permit(:text, :size)
  end
end
