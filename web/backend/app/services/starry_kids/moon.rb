# frozen_string_literal: true

require 'numo/narray'

module StarryKids
  class Moon
    class << self
      def emoji
        # 🌑
        moon0 = Numo::Int32.cast([[-1, -1, -1, -1],
                                  [-1, -1, -1, -1],
                                  [-1, -1, -1, -1],
                                  [-1, -1, -1, -1]])
        # 🌒
        moon1 = Numo::Int32.cast([[-1, -1, -1, 1],
                                  [-1, -1, -1, 1],
                                  [-1, -1, -1, 1],
                                  [-1, -1, -1, 1]])
        # 🌓
        moon2 = Numo::Int32.cast([[-1, -1, 1, 1],
                                  [-1, -1, 1, 1],
                                  [-1, -1, 1, 1],
                                  [-1, -1, 1, 1]])
        # 🌔
        moon3 = Numo::Int32.cast([[-1, 1, 1, 1],
                                  [-1, 1, 1, 1],
                                  [-1, 1, 1, 1],
                                  [-1, 1, 1, 1]])
        # 🌘
        moon4 = Numo::Int32.cast([[1, -1, -1, -1],
                                  [1, -1, -1, -1],
                                  [1, -1, -1, -1],
                                  [1, -1, -1, -1]])
        # 🌗
        moon5 = Numo::Int32.cast([[1, 1, -1, -1],
                                  [1, 1, -1, -1],
                                  [1, 1, -1, -1],
                                  [1, 1, -1, -1]])
        # 🌖
        moon6 = Numo::Int32.cast([[1, 1, 1, -1],
                                  [1, 1, 1, -1],
                                  [1, 1, 1, -1],
                                  [1, 1, 1, -1]])
        # 🌕
        moon7 = Numo::Int32.cast([[1, 1, 1, 1],
                                  [1, 1, 1, 1],
                                  [1, 1, 1, 1],
                                  [1, 1, 1, 1]])

        [moon0, moon1, moon2, moon3, moon4, moon5, moon6, moon7]
      end

      def convert_to_emoji(index)
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
        else
          '🌕'
        end
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  moon = StarryKids::Moon
  print moon.emoji
end
