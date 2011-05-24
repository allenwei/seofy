module Seofy
  module Adapters
    class Base36 < Base 
      attr_reader :options, :length, :column
      def initialize(options={})
        super(options)
        @length = options[:length]
      end

      def seofy_slug(inst)
        inst.send(self.column)
      end

      def set_seofy_slug(inst)
        slug_exist = true
        while slug_exist
          random = ::Seofy::Encoders::Base36.random(self.length) 
          if inst.class.exists?(["#{column} = ?", random])
            slug_exist = true
          else
            inst.send("#{column}=", random)
            slug_exist = false
          end
        end
      end
    end
  end
end
