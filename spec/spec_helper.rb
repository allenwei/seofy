require 'rspec'
require 'logger'
require 'active_record'
require 'active_support'
require 'yaml'
require 'sqlite3'

$:.unshift File.expand_path("../../lib", __FILE__)
require 'seofy'

require 'models'
require 'models_migration'
dbconfig = YAML.load_file(File.expand_path("../database.yml",__FILE__)) 
ActiveRecord::Base.establish_connection(dbconfig)

ActiveRecord::Base.logger = Logger.new($stdout) 


CreateModels.up

RSpec.configure do |c|
#c.filter_run_excluding :integration => true
end

