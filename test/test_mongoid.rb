require 'minitest/autorun'

class TestMongoid < MiniTest::Test
  def setup
  end

  def test_mongoid_has_one_active_record_defined
    assert_equal true, Camel.respond_to?(:has_one_active_record)
  end

  def test_mongoid_has_many_active_record_defined
    assert_equal true, Camel.respond_to?(:has_many_active_record)
  end

  def test_mongoid_has_many_active_records_defined
    assert_equal true, Camel.respond_to?(:has_many_active_records)
  end

  def test_mongoid_belongs_to_active_record_defined
    assert_equal true, Camel.respond_to?(:belongs_to_active_record)
  end

  def test_has_one_active_record
    @c = Camel.new
    assert_equal true,  @c.respond_to?('tongue')
    assert_equal false, @c.respond_to?('tongues')
  end

  def test_has_many_active_record
    @c = Camel.new
    assert_equal true,  @c.respond_to?('humps')
    assert_equal false, @c.respond_to?('hump')
  end

  def test_belongs_to_active_record
    @c = Camel.new
    assert_equal true,  @c.respond_to?('species')
  end

  def test_implements_consorts
    assert Camel.respond_to?('mongoid_consorts_with_active_record?')
    assert Camel.mongoid_consorts_with_active_record?
  end
end
