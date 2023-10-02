class V1::TextToMoonsController < ApplicationController
  def index
    p ''
  end

  private

  def moon_params
    params[:size] ||= 20
    params.permit(:text, :size)
  end
end
