# Validates [![Build Status](https://travis-ci.org/kaize/validates.png)](https://travis-ci.org/kaize/validates)

Collection of useful custom validators for Rails 3 applications, including:

- EmailValidator
- UrlValidator
- SlugValidator
- MoneyValidator
- InnValidator
- AssociationLengthValidator
- AbsolutePathValidator

## Installation

Add this line to your application's Gemfile:

    gem 'validates'

Or install it yourself as:

    $ gem install 'validates'

## Usage

For most of the validators you just want to add this line to your model:

    validates :attribute, <validator_underscore>: true

where `<validator_underscore>` is an underscored, lowercase form from the validator's name (see the examples section below).

### AssociationLengthValidator

Because this is the successor of ActiveModel::Validations::LengthValidator
validator, it inherits all the options of the latter, such as `:is`, `:minimum`,
`:maximum`, etc. Another option, which you may be interested in is `:select` option,
which allows you to filter the collection of the associated objects.

## Examples

    class User < ActiveRecord::Base
      validates :email, :email => true
      validates :site, :url => true, :allow_blank => true
      validates :inn, :inn => true   
    end

    class Company < ActiveRecord::Base
      # note AssociationLengthValidator is inherited from ActiveModel::Validations::LengthValidator
      # http://api.rubyonrails.org/classes/ActiveModel/Validations/LengthValidator.html
      # so you can easily use standard options like :is, :minimum, :maximum, etc.

      validates :employees,
        :association_length => {
          :minimum => 1,
          :select => ->(employee) { employee.name.in? ["Mike", "John"] }
        }

      validates :employees, :association_length => { :minimum => 1, :select => :employees_filter }

      def employees_filter(employees)
        employees.select { |employee| employee.name.in? ["Mike", "John"] }
      end
    end

    class Page < ActiveRecord::Base
      validates :slug, :slug => true
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Test your changes by running `turn -Itest test/lib` command
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request