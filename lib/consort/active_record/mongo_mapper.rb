module Consort
  ##
  # Defines methods on ActiveRecord objects for creating MongoMapper
  # relationships and accessing those related objects.
  module ActiveRecord
    module MongoMapper
      extend ActiveSupport::Concern

      module ClassMethods
        # Defines a `has_one` relationship with a MongoMapper object.
        # @param klass [Symbol]
        # @example
        #   has_one_mongo_mapper :dolphin
        def has_one_mongo_mapper(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(#{name.foreign_key}: id)
            end
          CODE
        end

        # Defines a `has_many` relationship with a MongoMapper object.
        # @param klass [Symbol] 
        # @example
        #   has_many_mongo_mapper :unicorns
        # @since 0.0.2
        def has_many_mongo_mapper(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(#{name.foreign_key}: id)
            end
          CODE
        end

        # @deprecated Use {#has_many_mongo_mapper} instead. Will be removed soon.
        def has_many_mongo_mappers(klass)
          ActiveSupport::Deprecation.warn 'This method will be removed in 3 releases. Please use the singular has_many_mongo_mapper instead.'
          has_many_mongo_mapper(klass)
        end

        # Defines a `belongs_to` relationship with a MongoMapper object.
        # An appropriate foreign key column (of type String) must exist on your model.
        # @param klass [Symbol] 
        # @example Migration
        #   class AddMongoMapperFKeyToNarwhals < ActiveRecord::Migration
        #     def change
        #       add_column :narwhals, :pod_id, :string
        #     end
        #   end
        # @example Model
        #   class Narwhal < ActiveRecord::Base
        #     belongs_to_mongo_mapper :pod
        #   end
        def belongs_to_mongo_mapper(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(id: #{klass.to_s.foreign_key})
            end
          CODE
        end
      
        # Allows easy validation of whether ActiveRecord to MongoMapper bridge is loaded.
        # @return [Boolean] `true` if bridge is loaded
        def active_record_consorts_with_mongo_mapper?
          true
        end
      end
    end
  end
end

#if defined?(ActiveRecord::Base)
class ActiveRecord::Base
  include Consort::ActiveRecord::MongoMapper
end
#end