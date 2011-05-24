module Seofy
  module Adapters 
    class ExistingColumn < Base 
      attr_reader :column
      def initialize(options={}) 
        super(options)
      end

      def seofy_slug(inst)
        inst.send(self.column)
      end

      def set_seofy_slug(inst)
      end

    end
  end
end

