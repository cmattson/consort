require 'minitest/autorun'

class TestMongoMapper < MiniTest::Unit::TestCase
  def setup
#    MongoMapper.database = 'test_consort'
  end

  # ---------------------------------------------------------------------------
  # MongoMapper object has ActiveRecord associations
  # ---------------------------------------------------------------------------
  def test_mongo_mapper_belongs_to_active_record_defined
    assert Beverage.respond_to?(:has_one_active_record)
  end
  
  def test_mongo_mapper_has_one_active_record_defined
    assert Beverage.respond_to?(:has_one_active_record)
  end
  
  def test_mongo_mapper_has_many_active_record_defined
    assert Beverage.respond_to?(:has_many_active_record)
  end
  
  def test_mongo_mapper_has_one_active_record
    b = Beverage.new
    assert b.respond_to? :chemical_composition
    refute b.respond_to? :chemical_compositions
  end
  
  def test_mongo_mapper_has_many_active_record
    b = Beverage.new
    assert b.respond_to? :flavors
    refute b.respond_to? :flavor
  end
  
  def test_mongo_mapper_belongs_to_active_record
    b = Beverage.new
    assert b.respond_to? :liquid
    refute b.respond_to? :liquids
  end
  
  def test_mongo_mapper_implements_consorts
    assert Beverage.respond_to?('mongo_mapper_consorts_with_active_record?')
    assert Beverage.mongo_mapper_consorts_with_active_record?
  end

  # ---------------------------------------------------------------------------
  # ActiveRecord object has MongoMapper associations
  # ---------------------------------------------------------------------------
  
  def test_active_record_has_one_mongo_mapper_defined
    assert_equal 'method', defined? ActiveRecord::Base.has_one_mongo_mapper
    assert_equal true, ActiveRecord::Base.respond_to?('has_one_mongo_mapper')
  end

  def test_active_record_has_many_mongo_mapper_defined
    assert_equal 'method', defined? ActiveRecord::Base.has_many_mongo_mapper
    assert_equal true, ActiveRecord::Base.respond_to?('has_many_mongo_mapper')
  end

  def test_active_record_belongs_to_mongo_mapper_defined
    assert_equal 'method', defined? ActiveRecord::Base.belongs_to_mongo_mapper
    assert_equal true, ActiveRecord::Base.respond_to?('belongs_to_mongo_mapper')
  end

  def test_active_record_has_one_mongo_mapper
    p = Pinniped.new
    assert p.respond_to? :walrus
    refute p.respond_to? :walruses
  end

  def test_active_record_has_many_mongo_mapper
    p = Pinniped.new
    assert p.respond_to? :seals
    refute p.respond_to? :seal
  end

  def test_active_record_belongs_to_mongo_mapper
    p = Pinniped.new
    assert p.respond_to? :flippy_sea_creature
    refute p.respond_to? :flippy_sea_creatures
  end
  
  def test_active_record_implements_consorts
    assert ActiveRecord::Base.respond_to?('active_record_consorts_with_mongo_mapper?')
    assert ActiveRecord::Base.active_record_consorts_with_mongo_mapper?
  end
end