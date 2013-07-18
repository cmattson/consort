require 'minitest/autorun'

class TestMongoid < Minitest::Test
  def setup
  end

  def test_mongoid_has_one_active_record_defined
    assert_equal true, Camel.respond_to?(:has_one_active_record)
  end

  def test_mongoid_has_many_active_records_defined
    assert_equal true, Camel.respond_to?(:has_many_active_records)
  end

  def test_mongoid_belongs_to_active_record_defined
    assert_equal true, Camel.respond_to?(:belongs_to_active_record)
  end

end