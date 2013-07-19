module Consort
  ##
  # Defines instance methods on ActiveRecord objects for defining NoSQL
  # relationships and accessing those related objects.
  module ActiveRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def has_one_mongoid(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(#{name.foreign_key}: id)
          end
        CODE
      end

      def has_many_mongoid(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(#{name.foreign_key}: id)
          end
        CODE
      end

      # DEPRECATED. Pass through for now. Removed in 1.0.0.
      def has_many_mongoids(klass)
        ActiveSupport::Deprecation.warn 'Please use the singular has_many_mongoid instead.'
        has_many_mongoid(klass)
      end

      def belongs_to_mongoid(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(id: #{klass.to_s.foreign_key})
          end
        CODE
      end

      def active_record_consorts_with_mongoid?
        true
      end
    end

  end
end

class ActiveRecord::Base
  include Consort::ActiveRecord
end