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
      
      def before_create(inst)
        set_seofy_slug(inst)
      end

      def after_create(inst)
        # do nothing
      end

      def need_update_slug?
        true
      end

    end
  end
end
