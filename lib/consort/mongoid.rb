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

      def has_many_active_records(klass)
        class_eval <<-CODE
          def #{klass}
            #{klass.to_s.classify}.where(#{name.foreign_key}: id)  
          end
        CODE
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