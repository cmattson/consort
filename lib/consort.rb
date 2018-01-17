require 'consort/version'

# require 'active_record'
# require 'mongoid'

if defined?(ActiveRecord::Base) && defined?(Mongoid::Document)
  require 'consort/active_record/mongoid'
  require 'consort/mongoid/active_record'
end

# if defined?(ActiveRecord::Base) && defined?()
