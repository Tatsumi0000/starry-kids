require 'mini_magick'
require 'numo/narray'

# 画像のパスを指定
image_path = 'data/images/dummy.png'
font_path = 'data/fonts/NotoSansJP-Regular.ttf'

# 画像を読み込む
image = MiniMagick::Image.open(image_path)

# テキストを描画
text = 'A'
font_size = 16
text_color = 'black'

image.combine_options do |b|
  b.gravity 'center'
  b.fill text_color
  b.pointsize font_size
  b.font font_path
  b.extent "#{image.width}x#{image.height}"
  b.annotate '+0+0', text
  b.colorspace 'Gray'
end
pixels = image.get_pixels
puts '-----'
# p pixels
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
puts 'gray----scale'
p gray_scale

# p rgb_values

# 画像のピクセル値を-1 ~ 1で正規化
# img = (gray_image / 128.0) - 1.0

# p img

# やること
# ピクセルと月の絵文字の対応を作る

# 画像を保存
output_path = 'output.jpg'
image.write(output_path)
