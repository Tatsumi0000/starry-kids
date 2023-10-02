class V1::TextToMoonsController < ApplicationController
  def index
    p ''
  end

  private

  def moon_params
    params.permit(:text)
  end
end
