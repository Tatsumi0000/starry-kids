require 'rails_helper'

RSpec.describe Converter::TextToMoon, type: :model do
  describe '.call' do
    context 'textに半角全角英数字、ひらがなカタカナ以外の文字が含まれているとき' do
      it '漢字を含んでいるのでエラーが発生することを確認' do
        text_to_moon = Converter::TextToMoon.new(text: '漢字', size: 10)
        expect(text_to_moon.valid?).to be false
      end
    end

    context 'textに半角全角英数字、ひらがなカタカナの文字が含まれているとき' do
      it 'ひらがなのみなのでエラーにならないことを確認' do
        text_to_moon = Converter::TextToMoon.new(text: 'あいうえお', size: 10)
        expect(text_to_moon.valid?).to be true
      end

      it 'カタカナのみなのでエラーにならないことを確認' do
        text_to_moon = Converter::TextToMoon.new(text: 'アイウエオ', size: 10)
        expect(text_to_moon.valid?).to be true
      end

      it '半角英数字のみなのでエラーにならないことを確認' do
        text_to_moon = Converter::TextToMoon.new(text: 'abcde12345', size: 10)
        expect(text_to_moon.valid?).to be true
      end

      it '全角英数字のみなのでエラーにならないことを確認' do
        text_to_moon = Converter::TextToMoon.new(text: 'ＡＢＣＤＥ１２３４５', size: 10)
        expect(text_to_moon.valid?).to be true
      end

      it 'textとsizeに受け取ったパラメータが設定されていることを確認' do
        text_to_moon = Converter::TextToMoon.new(text: 'ＡＢＣＤＥ１２３４５', size: 10)
        response = text_to_moon.call
        expect(response[:text]).to eq 'ＡＢＣＤＥ１２３４５'
        expect(response[:size]).to eq 10
      end

    end
  end
end
