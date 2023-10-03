# テキストから月文字を生成するモデルクラス
module Converter
  class TextToMoon
    # sizeが1につき縦横4pxを使用する（sizeを4倍にするために使用）
    CONVERT_SIZE = 4

    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :text, :string
    attribute :size, :integer, default: 20

    validates :text, presence: true, length: { minimum: 1, maximum: 20 },
                     format: { with: /\A[a-zA-Z0-9０-９ぁ-んァ-ン゛゜一]+\z/, message: '変換できるのは全角半角英数字、ひらがなカタカナのみです。' }
    validates :size, presence: true, length: { minimum: 20, maximum: 100 }

    def self.call(text, size)
      convert_image_to_moon = StarryKids::ConvertImageToMoonService.new(size * CONVERT_SIZE)
      text.chars.map { |char| convert_image_to_moon.call(char) }
    end
  end
end
