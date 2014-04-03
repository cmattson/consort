plugin_test_dir = File.dirname(__FILE__)

require 'rubygems'

require 'simplecov'
require 'coveralls'

if ENV['TRAVIS']
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

SimpleCov.start do
  add_filter '/test'
end

require 'bundler/setup'
require 'pry'

require 'combustion'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/spec'
require 'minitest/pride'
require 'minitest/benchmark' if ENV['BENCH']

require 'active_record'
require 'mongoid'
require 'mongo_mapper'

require 'consort'

require 'yaml'
require 'erb'
ActiveRecord::Base.configurations = YAML.load(ERB.new(IO.read(plugin_test_dir + '/db/database.yml')).result)
ActiveRecord::Base.establish_connection(ENV['DB'] ||= 'sqlite3mem')
ActiveRecord::Migration.verbose = false

require 'combustion/database'
Combustion::Database.create_database(ActiveRecord::Base.configurations[ENV['DB']])
load(File.join(plugin_test_dir, 'db', 'schema.rb'))

require 'models'
