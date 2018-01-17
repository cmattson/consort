# Consort

[![Build Status](https://travis-ci.org/cmattson/consort.png?branch=master)](https://travis-ci.org/cmattson/consort)
[![Coverage Status](https://coveralls.io/repos/cmattson/consort/badge.png)](https://coveralls.io/r/cmattson/consort)
[![Code Climate](https://codeclimate.com/github/cmattson/consort.png)](https://codeclimate.com/github/cmattson/consort)
[![Gem Version](https://badge.fury.io/rb/consort.png)](http://badge.fury.io/rb/consort)

Mixing ActiveRecord and other ORMs like Mongoid? Need relationships between those data layers? Really hate either implementing a bunch of accessors or copy-pasting the same metaprogramming over and over again?

Use Consort! Built around a simple modification to standard ActiveRecord association syntax, Consort allows you to more easily retrieve data from cross-ORM single-to-single and single-to-many associations without writing or recycling code.

## Once More, With 50% Less Jargon

If you have a Rails app using both ActiveRecord and Mongoid, you've probably discovered you can't create associations between the two.

Consort allows you to define `has_one`, `has_many`, and `belongs_to` associations between ActiveRecord and Mongoid object classes. (And it can be extended to support nearly any combination of ORM and ODM adapters, but ActiveRecord <-> Mongoid is what's written today.)

## Installation

Add this line to your application's Gemfile:

    gem 'consort'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install consort

## Requirements

A currently-supported Ruby version (2.2.x – 2.5.x). Alternate VMs compatible with these versions *should* also work. If you're using an alternative interpreter and would like it added to the test matrix, let me know!

**N.B.**: Versions (i.e. 2.2) will be dropped from this list as they leave maintenance. If you're still using Ruby 2.2, now's a great time to consider updating.

Ruby 1.8 and 1.9 are not supported. Let the dead rest in peace!

### Rails Compatibility

Consort 1.x targets Rails 5 (or, more accurately, ActiveSupport and ActiveRecord 5.0 and 5.1).

Rails 5.2 support will be finalized as Rails 5.2 reaches RC.

The support window for Consort generally follows the [Ruby on Rails Maintenace Policy](http://guides.rubyonrails.org/maintenance_policy.html).

### ODM Compatibility

Consort currently supports ActiveRecord 5 and Mongoid 6.

While MongoMapper support was available in a previous Consort release, MongoMapper is no longer actively updated and does not support current versions of Mongo or Rails.

### Continuous Integration

Automated CI testing is performed against Ruby 2.2.9, 2.3.6, 2.4.3, and 2.5.0 using ActiveRecord and ActiveSupport 5.0 and 5.1.

## Usage

Consort allows basic relationships to be defined between ActiveRecord and other ORM layers. Simply add `_[ORM_TYPE]` to what you'd normally use. `active_record` and `mongoid` are currently supported.

The relationship macros are designed to read cleanly:

* Airframe has one ActiveRecord powerplant
* Airframe has many Mongoid variants

On an ActiveRecord model, you can define relationships with Mongoid:

```ruby
class Airframe < ActiveRecord::Base
  belongs_to_mongoid  :manufacturer
  has_one_mongoid     :powerplant
  has_many_mongoid    :variants
end
```

On a Mongoid model, you can define relationships with ActiveRecord:

```ruby
class Airframe
  include Mongoid::Document
  belongs_to_active_record  :manufacturer
  has_one_active_record     :powerplant
  has_many_active_record    :variants

  # Consort expects a foreign key field
  field :manufacturer_id,   type: Integer
end
```

### Unimplemented Features
There are several things Consort doesn't (currently) do, either because I haven't
seen them used when mixing object mappers, or because they may have horrible
unintended consequences.

This doesn't mean Consort *shouldn't* do them; if you have a use case for a
missing feature, feel free to implement it and send a pull request, or create an
issue with a feature request.

#### Many-to-Many Relationships
Consort doesn't support many-to-many relationships. I've rarely run into a
situation where they make sense in cross-ORM applications, and implementing them
would require making decisions like "where do we store them?".

#### Polymorphism
Also low on the list of use cases.

#### Callbacks
This falls into the potential horrible unintended consequences group.

Consort *does not* currently implement automatic callbacks (e.g. destroying a
Mongoid object automatically when its parent ActiveRecord object is destroyed). If
creating/altering/deleting an object from one object mapper should
create/alter/delete an associated object from a different object mapper, you
currently need to take care of this yourself.

## Contributing

1. [Fork it](https://github.com/cmattson/consort/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. No, seriously, create a branch. Please. Call it `ravenous-monkey` for all I care, but create a branch.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

Make sure you include tests! Tests are good. Tests are required. All hail tests.

Consort tests are built with Minitest; beyond that, I'm flexible. `Minitest::Unit` and `Minitest::Spec` are both fine.


## Author

[Colin Mattson](https://github.com/cmattson)
