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
        inst.send("#{column}=", ::Seofy::Encoders::Base36.random(self.length))
      end
    end
  end
end
