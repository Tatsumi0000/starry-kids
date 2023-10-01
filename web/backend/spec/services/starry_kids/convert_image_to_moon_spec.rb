# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StarryKids::ConvertImageToMoonService, type: :service do
  let!(:service) { StarryKids::ConvertImageToMoonService.new(80) }

  context '文字が「あ」のとき' do
    let!(:moon) { service.call('あ') }

    it '左上が「🌕」であることを確認' do
      expect(moon[0]).to eq '🌕'
    end

    it '総文字数が420文字であることを確認' do
      # 80x80の画像は4x4の範囲を1つの月として表現するので、
      # 80 / 4 = 20。それを縦横なので 20 * 20 = 400になる
      # さらに改行文字が20個（高さの分）あるので 400 + 20 = 420
      expect(moon.length).to eq 420
    end
  end
end
