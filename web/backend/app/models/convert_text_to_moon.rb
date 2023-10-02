# テキストから月文字を生成するモデルクラス
class ConvertTextToMoon
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :text, :string
  attribute :size, :int
  
  validates :text, presence: true, length: { minimum: 1, maximum: 20 },
                   format: { with: /\A[a-zA-Z0-9０-９ぁ-んァ-ン゛゜一]+\z/, message: '変換できるのは全角半角英数字、ひらがなカタカナのみです。' }

  validates :size, presence: true, length: { minimum: 20, maximum: 100 }

 class << self

 end
  private 
  
end
