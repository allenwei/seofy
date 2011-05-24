module Seofy 
  module ActiveRecord  
    module ClassMethods
      def seofy(options={})
        init_seofy_config(options)
        include ::Seofy::ActiveRecord::InstanceMethods
        before_save :seofy_before_save
        after_save :seofy_after_save
      end

      def init_seofy_config(options={})
        class_attribute :seofy_config
        self.seofy_config = ::Seofy::Configuration.new(options)
      end

      def seofy_adapter
        self.seofy_config.adapter
      end

      def for_slug(param) 
        self.send("find_by_#{seofy_adapter.column}", param.split("-").last)
      end
    end

    module InstanceMethods 
      def to_param
        [seofy_source.to_s, seofy_slug].join("-").to_slug.normalize.to_s
      end

      def seofy_slug
        self.class.seofy_adapter.seofy_slug(self)
      end

      def seofy_source 
        self.send(self.class.seofy_config.source).to_s
      end

      def seofy_before_save
        self.class.seofy_adapter.before_save(self)
      end

      def seofy_after_save
        self.class.seofy_adapter.after_save(self)
      end

    end
  end
end

ActiveRecord::Base.extend Seofy::ActiveRecord::ClassMethods
