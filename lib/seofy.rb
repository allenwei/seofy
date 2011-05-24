require 'babosa'
require 'seofy/active_record'
require 'seofy/configuration'
require 'seofy/task_runner'
require 'seofy/adapters/base'
require 'seofy/adapters/existing_column'
require 'seofy/adapters/base36'
require 'seofy/encoders/base36'

module Seofy
end

require "seofy/railtie" if defined?(Rails) && Rails.version >= "3"

