class ConvertTextToMoon < ApplicationRecord
  validates :text, presence: true
  validates :text, length: { minimum: 1, maximum: 20 }
  validates :text, format: { with: /\A[a-zA-Z0-9０-９ぁ-んァ-ン゛゜一]+\z/, message: '変換できるのは全角半角英数字、ひらがなカタカナのみです。' }
end
