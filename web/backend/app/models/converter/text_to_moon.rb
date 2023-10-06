# テキストから月文字を生成するモデルクラス
module Converter
  class TextToMoon
    include ActiveModel::Model
    include ActiveModel::Attributes

    # sizeが1につき縦横4pxを使用する（sizeを4倍にするために使用）
    CONVERT_SIZE = 4

    attribute :text, :string
    attribute :size, :integer, default: 20

    validates :text, presence: true
    validates :text, length: { minimum: 1, maximum: 20 }
    validates :text, format: { with: /\A[ぁ-んァ-ンa-zA-Z0-9ー０-９Ａ-Ｚａ-ｚ 　]+\z/, message: '変換できるのは全角半角英数字、ひらがなカタカナのみです。' }
    validates :size, numericality: { only_integer: true, greater_than_or_equal_to: 20, less_than_or_equal_to: 100 }

    def initialize(params = {})
      super(params)
    end

    def call
      font_size = size * CONVERT_SIZE
      convert_image_to_moon = StarryKids::ConvertImageToMoonService.new(font_size)
      response = text.chars.map { |char| convert_image_to_moon.call(char) }
      { text:, size:, response: }
    end
  end
end
