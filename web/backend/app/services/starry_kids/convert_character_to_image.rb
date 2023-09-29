require 'mini_magick'
require 'numo/narray'

module StarryKids
  class ConvertCharacterToImage
    def initialize(font_size = 160)
      base_file_path = File.dirname(__FILE__)
      @font_size = font_size
      @image = MiniMagick::Image.open(File.join(base_file_path, './data/images/dummy.png'))
      @font_path = File.join(base_file_path, './data/fonts/NotoSansJP-Regular.ttf')
    end

    # 文字を画像に変換する
    # ひらがなやアルファベットを想定する
    # 漢字だと16*16では表現できない可能性がある
    def generate_text_image(character)
      @image.combine_options do |b|
        b.gravity 'center'
        b.fill 'black'
        b.pointsize @font_size
        b.font @font_path
        # 画像サイズは4の倍数にしないときれいにならない可能性がある
        b.extent "#{@font_size}x#{@font_size}"
        b.annotate '+0+0', character
        b.colorspace 'Gray'
      end
    end

    # 画像をグレイスケール画像に変換してピクセルの配列を返す
    # @return [Array] グレースケール化したピクセルの配列
    def convert_to_graysclae_pixels
      pixels = @image.get_pixels
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

    # -1 ~ 1.0の範囲に正規化する
    # @param [Array] グレースケール化したピクセルの配列
    # @return [Numo::Float] Numo::Floatの-1~1で正規化したピクセルの配列
    def self.normalize(array)
      (Numo::Int32.cast(array) / 128.0) - 1.0
    end
  end
end

if $0 == __FILE__
  moon = StarryKids::Moon
  p moon.emoji
end
