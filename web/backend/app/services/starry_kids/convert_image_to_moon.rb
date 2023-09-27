require 'numo/narray'

module StarryKids
  class ConvertImageToMoon
    class << self
      
      # -1 ~ 1.0の範囲に正規化する
      def normalize(array)
        (Numo::Int32.cast(array) / 128.0) - 1.0
      end
    end

  end
end
