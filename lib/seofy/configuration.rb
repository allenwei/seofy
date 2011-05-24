module Seofy
  class Configuration
    attr_reader :source, :adapter
    def initialize(options)
      @source = options[:source]
      adapter_klass = "seofy/adapters/#{options[:adapter]}".camelize.constantize
      @adapter = adapter_klass.new(options[:adapter_option])
    end
  
  end
end
