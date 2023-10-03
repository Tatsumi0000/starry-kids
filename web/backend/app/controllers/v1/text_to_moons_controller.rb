class V1::TextToMoonsController < ApplicationController
  def index
    @moons = Converter::TextToMoon.call(moon_params[:text], moon_params[:size])
    # TODO: ここでバリデーションの結果を良い感じに表示する
    render json: @moons
  end

  private

  def moon_params
    params.permit(:text, :size)
  end
end
