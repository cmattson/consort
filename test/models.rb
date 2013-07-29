# Testing of AR bindings with light testing of Mongoid reverses
class Ungulate < ActiveRecord::Base
  has_one_mongoid     :mango
  has_many_mongoid    :bongos
  belongs_to_mongoid  :congo
end

class Mango
  include Mongoid::Document
  belongs_to_active_record :ungulate

  field :ripeness,        type: Integer
  field :ar_instance_id,  type: Integer
end

class Bongo
  include Mongoid::Document
  belongs_to_active_record :ungulate

  field :diameter,  type: Integer
  field :number,    type: Integer
end

class Congo
  include Mongoid::Document
  has_one_active_record :ungulate

  field :village_name, type: String
end

# -----------------------------------------------------------------------------
# ActiveRecord <-> MongoMapper
# -----------------------------------------------------------------------------

class FlippySeaCreature
  include MongoMapper::Document
  has_many_active_record :pinnipeds
  
  key :flippers, Integer
end

class Pinniped < ActiveRecord::Base
  has_many_mongo_mapper   :seals
  has_one_mongo_mapper    :walrus
  belongs_to_mongo_mapper :flippy_sea_creature
end

class Seal
  include MongoMapper::Document
  belongs_to_active_record :pinniped
  key :pinniped_id, Integer
  
  key :name, String
  key :hairiness, Integer
end

class SeaLion
  include MongoMapper::Document
  belongs_to_active_record :pinniped
end
  
class Walrus
  include MongoMapper::Document
  belongs_to_active_record :pinniped
  key :pinniped_id, Integer
  
  key :tusk_length, Integer
end


class Liquid < ActiveRecord::Base
  has_many_mongo_mapper     :beverages
end

class Beverage
  include MongoMapper::Document
  belongs_to_active_record  :liquid
  has_one_active_record     :chemical_composition
  has_many_active_record    :flavors
end

class ChemicalComposition < ActiveRecord::Base
  belongs_to_mongo_mapper   :beverage
end

class Flavor < ActiveRecord::Base
  belongs_to_mongo_mapper   :beverage
end


# -----------------------------------------------------------------------------
# Testing of Mongoid bindings with light testing of reverses
# -----------------------------------------------------------------------------
class Camel
  include Mongoid::Document
  has_one_active_record     :tongue
  has_many_active_record    :humps
  belongs_to_active_record  :species

  field :name, type: String
end

class Tongue < ActiveRecord::Base
  belongs_to_mongoid :camel
end

class Hump < ActiveRecord::Base
  belongs_to_mongoid :camel
end

class Species < ActiveRecord::Base
  has_many_mongoid :camels
end