require 'numo/narray'
require_relative 'moon'
require_relative 'convert_character_to_image'

module StarryKids
  class ConvertImageToMoon
    def initialize
      @convert_character_to_image = StarryKids::ConvertCharacterToImage.new
    end

    # 文字→画像→月文字に変換する
    # @param [String] character 月文字にしたい1文字
    def call(character)
      # 月文字を入れる配列
      moon_array = []
      @convert_character_to_image.generate_text_image(character)
      gray_scale_image = @convert_character_to_image.convert_to_graysclae_pixels
      normalize = ConvertCharacterToImage.normalize(gray_scale_image)
      # 行数(shape[0])と列数(shape[1])を 1 / 4 した分だけ計算する。
      # 1 / 4 するのは4 * 4ピクセルを1文字の月で表現するため。
      (normalize.shape[0] / 4).times do |i|
        (normalize.shape[1] / 4).times do |j|
          row = 4 * i
          col = 4 * j
          max = -100
          max_index = 0

          StarryKids::Moon.emoji.each_with_index do |moon, k|
            # 4*4の行列を抜き出して、月絵文字とのアダマール積を計算
            hadamard_product = normalize.slice(row...(row + 4), col...(col + 4)) * moon
            if hadamard_product.sum > max
              max_index = k
              max = hadamard_product.sum
            end
          end
          moon_array << StarryKids::Moon.convert_to_emoji(max_index)
        end
        moon_array << "\n"
      end
      moon_array.each { |emoji| print emoji }
    end
  end
end

if $0 == __FILE__
  convert_image_to_moon = StarryKids::ConvertImageToMoon.new
  convert_image_to_moon.call('A')
end
