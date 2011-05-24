module Seofy 
  module Encoders 
    module Base36
      THIRTY_SIX = ('0'..'9').to_a + ('a'..'z').to_a 
      LENGTH = THIRTY_SIX.size

      def encode( numeric )
        raise ArgumentError unless Numeric === numeric

        return '0' if numeric == 0
        s = ''

        while numeric > 0
          s << Base36::THIRTY_SIX[numeric.modulo(LENGTH)]
          numeric /= LENGTH
        end
        s.reverse
      end

      def decode( base36 )
        s = base36.to_s.reverse.split('')

        total = 0
        s.each_with_index do |char, index|
          if ord = THIRTY_SIX.index(char)
            total += ord * (LENGTH ** index)
          else
            raise ArgumentError, "#{base36} has #{char} which is not valid"
          end
        end
        total.to_s
      end

      def random(length) 
        Array.new(length) { THIRTY_SIX[rand(THIRTY_SIX.size - 1)] }.join
      end

      module_function :encode, :decode, :random
    end
  end
end
