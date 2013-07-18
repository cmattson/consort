# Testing of AR bindings with light testing of reverses
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

# Testing of Mongoid bindings with light testing of reverses
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