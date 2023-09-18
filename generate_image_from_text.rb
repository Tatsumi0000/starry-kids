require 'mini_magick'

# 画像のパスを指定
image_path = 'data/images/dummy.png'
font_path = 'data/fonts/NotoSansJP-Regular.ttf'

# 画像を読み込む
image = MiniMagick::Image.open(image_path)

# テキストを描画
text = 'A'
font_size = 16
text_color = 'black'

image.combine_options do |cmd|
  cmd.gravity 'center'
  cmd.fill text_color
  cmd.pointsize font_size
  cmd.font font_path
  cmd.extent "#{image.width}x#{image.height}"
  cmd.annotate '+0+0', text
end

# 画像を保存
output_path = 'output3.jpg'
image.write(output_path)
