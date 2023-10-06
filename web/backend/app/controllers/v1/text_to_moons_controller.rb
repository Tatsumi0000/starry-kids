# テキストから付き文字に変換するAPIのコントローラー
class V1::TextToMoonsController < ApplicationController
  before_action :validate_params

  def index
    @result = @text_to_moon.call
    render json: @result
  end

  private

  def moon_params
    params.permit(:text, :size)
  end

  def validate_params
    @text_to_moon = Converter::TextToMoon.new(moon_params)
    render json: { errors: @text_to_moon.errors }, status: :bad_request if @text_to_moon.invalid?
  end
end
