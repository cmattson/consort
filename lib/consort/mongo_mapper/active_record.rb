module Consort
  module MongoMapper
    module ActiveRecord
      extend ActiveSupport::Concern

      module ClassMethods
        # Defines a `has_one` relationship with an ActiveRecord object.
        # @param klass [Symbol]
        # @example
        #   has_one_active_record :dolphin
        def has_one_active_record(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(#{name.foreign_key}: id)
            end
          CODE
        end

        # Defines a `has_many` relationship with an ActiveRecord object.
        # @param klass [Symbol] 
        # @example
        #   has_many_active_record :unicorns
        # @since 0.0.2
        def has_many_active_record(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(#{name.foreign_key}: id)
            end
          CODE
        end

        # Defines a `belongs_to` relationship with an ActiveRecord object.
        # An appropriate foreign key key must exist on your model.
        # @param klass [Symbol] 
        # @example
        #   class Narwhal
        #     include MongoMapper::Document
        #
        #     belongs_to_active_record :pod
        #     key :pod_id, Integer
        #   end
        def belongs_to_active_record(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(id: #{klass.to_s.foreign_key})
            end
          CODE
        end

        # Allows easy validation of whether MongoMapper to ActiveRecord bridge is loaded.
        # @return [Boolean] `true` if bridge is loaded
        def mongo_mapper_consorts_with_active_record?
          true
        end
      end
    end
  end
end

module MongoMapper::Document
  include Consort::MongoMapper::ActiveRecord
end