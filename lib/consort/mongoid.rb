module Consort
  module Mongoid
    extend ActiveSupport::Concern

    module ClassMethods
      def has_one_active_record(klass)

      end

      def has_many_active_records(klass)

      end

      def belongs_to_active_record(klass)

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