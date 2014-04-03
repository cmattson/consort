ActiveRecord::Schema.define(version: 0) do

  create_table :ungulates, force: true do |t|
    t.column :name, :string
    t.column :congo_id, :string
  end

  create_table :tongues, force: true do |t|
    t.column :camel_id, :string
    t.column :slimy, :boolean
  end

  create_table :humps, force: true do |t|
    t.column :camel_id, :string
    t.column :number, :integer
    t.column :size_mm, :integer
  end

  create_table :species, force: true do |t|
    t.column :common_name, :string
    t.column :scientific_name, :string
  end

  create_table :pinnipeds, force: true do |t|
    t.column :flippy_sea_creature_id, :integer
  end

  #
  create_table :liquids, force: true do |t|
  end

  create_table :chemical_compositions, force: true do |t|
    t.column :beverage_id, :integer
  end

  create_table :flavors, force: true do |t|
    t.column :beverage_id, :integer
  end
end
