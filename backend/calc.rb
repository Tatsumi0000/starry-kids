require 'numo/narray'

module Moon
  class Config
    class << self
      def emoji
        # 🌑
        tsuki_0 = Numo::Int32.cast([[-1, -1, -1, -1],
                              [-1, -1, -1, -1],
                              [-1, -1, -1, -1],
                              [-1, -1, -1, -1]])
        # 🌒
        tsuki_1 = Numo::Int32.cast([[-1, -1, -1, 1],
                              [-1, -1, -1, 1],
                              [-1, -1, -1, 1],
                              [-1, -1, -1, 1]])
        # 🌓
        tsuki_2 = Numo::Int32.cast([[-1, -1, 1, 1],
                              [-1, -1, 1, 1],
                              [-1, -1, 1, 1],
                              [-1, -1, 1, 1]])
        # 🌔
        tsuki_3 = Numo::Int32.cast([[-1, 1, 1, 1],
                              [-1, 1, 1, 1],
                              [-1, 1, 1, 1],
                              [-1, 1, 1, 1]])
        # 🌘
        tsuki_4 = Numo::Int32.cast([[1, -1, -1, -1],
                              [1, -1, -1, -1],
                              [1, -1, -1, -1],
                              [1, -1, -1, -1]])
        # 🌗
        tsuki_5 = Numo::Int32.cast([[1, 1, -1, -1],
                              [1, 1, -1, -1],
                              [1, 1, -1, -1],
                              [1, 1, -1, -1]])
        # 🌖
        tsuki_6 = Numo::Int32.cast([[1, 1, 1, -1],
                              [1, 1, 1, -1],
                              [1, 1, 1, -1],
                              [1, 1, 1, -1]])
        # 🌕
        tsuki_7 = Numo::Int32.cast([[1, 1, 1, 1],
                              [1, 1, 1, 1],
                              [1, 1, 1, 1],
                              [1, 1, 1, 1]])
      end 
    end
  end
end

tsuki_0 = Int32.cast([[-1, -1, -1, -1],
  case index
  when 0
    '🌑'
  when 1
    '🌒'
  when 2
    '🌓'
  when 3
    '🌔'
  when 4
    '🌘'
  when 5
    '🌗'
  when 6
    '🌖'
  when 7
    '🌕'
  end

if $0 == __FILE__
  p tsuki_0
  p tsuki_1
  p tsuki_2
  p tsuki_3
  p tsuki_4
  p tsuki_5
  p tsuki_6
  p tsuki_7
end
end
