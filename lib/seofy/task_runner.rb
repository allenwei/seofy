module Seofy
  class TaskRunner
    attr_reader :klasses
    def initialize 
      @klasses = ENV["MODELS"]
    end

    def each_model
      self.klasses.split(",").each do |class_name| 
        klass = class_name.constantize
        yield klass if block_given?
      end
    end

    def update_all
      each_model do |klass|
        klass.find_each do |record| 
          update(record)
        end
      end
    end

    def update_null
      each_model do |klass|
        klass.find_each(:conditions => ["#{klass.seofy_adapter.column} is null"]) do |record| 
          update(record)
        end
      end
    end

    def update(record) 
      record.class.seofy_adapter.set_seofy_slug(record)
      record.save(:validate => false)
    end
  end
end