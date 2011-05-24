module Seofy
  module Adapters 
    class Base 
      attr_reader :options, :column
      def initialize(options={})        
        @options = options
        @column = options[:column]
      end

      def seofy_slug(inst)
        raise "not implement"
      end

      def set_seofy_slug(inst)
        raise "not implement"
      end
      
      def before_save(inst)
        set_seofy_slug(inst)
      end

      def after_save(inst)
        # do nothing
      end
    end
  end
end
