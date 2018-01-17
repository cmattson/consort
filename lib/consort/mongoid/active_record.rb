module Consort
  module Mongoid
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
        # An appropriate foreign key field must exist on your model.
        # @param klass [Symbol]
        # @example
        #   class Narwhal
        #     include Mongoid::Document
        #
        #     belongs_to_active_record :pod
        #     field :pod_id, type: Integer
        #   end
        def belongs_to_active_record(klass)
          class_eval <<-CODE
            def #{klass}
              #{klass.to_s.classify}.where(id: #{klass.to_s.foreign_key})
            end
          CODE
        end

        # Allows easy validation of whether Mongoid to ActiveRecord bridge is
        # loaded.
        # @return [Boolean] `true` if bridge is loaded
        def mongoid_consorts_with_active_record?
          true
        end
      end
    end
  end
end

module Mongoid::Document
  include Consort::Mongoid::ActiveRecord
end
