## master

* Nothing yet!

## 0.1.0pre1

* Added support for Rails/ActiveSupport 3.1.
* Added support for Rails/ActiveSupport 4.
* Added MongoMapper support.
* Removed dependencies on ActiveRecord and Mongoid. Bridges are now autoloaded based on what's available in the environment.

## 0.0.3

* Restructured modules. Now in format `Consort::FromORM::ToORM`, e.g. `Consort::ActiveRecord::Mongoid`.
* Travis now tests against Rails 3.1.12, 3.2.13, 4.0.0.

## 0.0.2

* Improved readability of macros. `has_many_*` methods are now singular.
* `has_many_mongoids` and `has_many_active_records` flagged for deprecation.

## 0.0.1

* Initial feature-barren version!