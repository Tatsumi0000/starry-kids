require 'numo/narray'
require_ralative 'convert_character_to_image'

module StarryKids
  class ConvertImageToMoon
    class << self
      
      private

      # -1 ~ 1.0の範囲に正規化する
      def normalize(array)
        (Numo::Int32.cast(array) / 128.0) - 1.0
      end
    end


  end
end
