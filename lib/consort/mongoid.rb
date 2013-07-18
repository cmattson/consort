module Consort
  module Mongoid
    extend ActiveSupport::Concern

    module ClassMethods
      def has_one_active_record(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(#{name.foreign_key}: id)
          end
        CODE
      end

      def has_many_active_record(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(#{name.foreign_key}: id)  
          end
        CODE
      end

      # DEPRECATED. Will be removed in 1.0.0.
      def has_many_active_records(klass)
        ActiveSupport::Deprecation.warn "Please use the singular has_many_active_record instead."
        has_many_active_record(klass)
      end

      def belongs_to_active_record(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(id: #{klass.to_s.foreign_key})
          end
        CODE
      end

      def mongoid_consorts_with_active_record?
        true
      end
    end

  end
end

module Mongoid::Document
  include Consort::Mongoid
end