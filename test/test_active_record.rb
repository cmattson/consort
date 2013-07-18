require 'minitest/autorun'

class TestActiveRecord < Minitest::Test
  def setup
    #@ungulate = Ungulate.new
  end

  def test_active_record_has_one_mongoid_defined
    assert_equal "method", defined? ActiveRecord::Base.has_one_mongoid
    assert_equal true, ActiveRecord::Base.respond_to?('has_one_mongoid')
  end

  def test_active_record_has_many_mongoids_defined
    assert_equal "method", defined? ActiveRecord::Base.has_many_mongoids
    assert_equal true, ActiveRecord::Base.respond_to?('has_many_mongoids')
  end

  def test_active_record_belongs_to_mongoid_defined
    assert_equal "method", defined? ActiveRecord::Base.belongs_to_mongoid
    assert_equal true, ActiveRecord::Base.respond_to?('belongs_to_mongoid')
  end

  def test_has_one_mongoid
    @u = Ungulate.new
    assert_equal true, @u.respond_to?('mango')
  end

  def test_has_many_mongoids
    @u = Ungulate.new
    assert_equal true, @u.respond_to?('bongos')
  end

  def test_belongs_to_mongoid
    @u = Ungulate.new
    assert_equal true, @u.respond_to?('congo')
  end
end