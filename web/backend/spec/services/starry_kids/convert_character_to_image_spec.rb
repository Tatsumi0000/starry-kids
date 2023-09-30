# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StarryKids::ConvertCharacterToImageService, type: :service do
  context 'フォントサイズが80のとき' do
    let!(:service) { StarryKids::ConvertCharacterToImageService.new(80) }

    context '文字が「あ」のとき' do
      let!(:generated_image) { service.generate_text_image('あ') }
      let!(:gray_scale_pixels) { service.convert_to_graysclae_pixels }

      it '画像サイズを80x80に変換していることを確認' do
        expect(generated_image.width).to eq 80
        expect(generated_image.height).to eq 80
      end

      it 'RGBの画像をグレースケールしていることを確認' do
        # 元画像はRGBの3値なので3
        expect(generated_image.get_pixels[0][0].length).to eq 3
        # グレースケール化すると輝度のみの1値になる
        # 2次元の配列でいいのでサイズを比較
        expect(gray_scale_pixels[0].length).to eq 80
        expect(gray_scale_pixels[1].length).to eq 80
      end
    end
  end

  context 'フォントサイズが4のとき' do
    let!(:gray_scale_pixels) { [[0, 0, 0, 0], [128, 128, 128, 128], [1, 1, 1, 1], [255, 255, 255, 255]] }

    it '正規化したときに-1 ~ 1.0の範囲になることを確認' do
      normalize = StarryKids::ConvertCharacterToImageService.normalize(gray_scale_pixels)
      p normalize
      expect(normalize[0, true]).to eq Numo::DFloat.cast([-1.0, -1.0, -1.0, -1.0])
      expect(normalize[1, true]).to eq Numo::DFloat.cast([0, 0, 0, 0])
      expect(normalize[2, true]).to eq Numo::DFloat.cast([-0.9921875, -0.9921875, -0.9921875, -0.9921875])
      expect(normalize[3, true]).to eq Numo::DFloat.cast([0.9921875, 0.9921875, 0.9921875, 0.9921875])
    end
  end
end
