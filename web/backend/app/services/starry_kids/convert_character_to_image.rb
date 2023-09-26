require 'mini_magick'
require 'numo/narray'

module StarryKids
  class ConvertCharacterToImage

    def initialize(font_size = 16)
      @font_size = font_size
      @image = MiniMagick::Image.open('data/images/dummy.png')
      @font_path = 'data/fonts/NotoSansJP-Regular.ttf'
    end

    # 文字を画像に変換する
    def generate_text_image(character)
      @image.combine_options do |b|
        b.gravity 'center'
        b.fill 'black'
        b.pointsize @font_size
        b.font @font_path
        b.extent "#{@font_size}x#{@font_size}"
        b.annotate '+0+0', character
        b.colorspace 'Gray'
      end
    end

    # 画像をグレイスケール画像に変換してピクセルの配列を返す
    def convert_to_graysclae_pixels
      pixels = image.get_pixels
      gray_scale = []
      pixels.each_with_index do |rgbs, i|
        gray_scale[i] = []
        rgbs.each_with_index do |rgb, j|
          # ITU-R Rec BT.709の計算式を使います。
          # これが人間の目にとって一番自然なグレースケール値になるみたいです。
          # https://qiita.com/yoya/items/96c36b069e74398796f3#cie-xyz-%E3%81%AE-y
          gray_scale[i][j] = rgb[0] * 0.2126 + rgb[1] * 0.7152 + rgb[2] * 0.0722
        end
      end
      gray_scale
    end
  end
end

if $0 == __FILE__
  moon = StarryKids::Moon
  p moon.emoji
end
