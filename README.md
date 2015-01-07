# Validates [![Gem Version](https://badge.fury.io/rb/validates.png)](http://badge.fury.io/rb/validates) [![Build Status](https://travis-ci.org/kaize/validates.png)](https://travis-ci.org/kaize/validates) [![Code Climate](https://codeclimate.com/github/kaize/validates.png)](https://codeclimate.com/github/kaize/validates)

Collection of useful custom validators for Rails applications, including:

- EmailValidator
- UrlValidator
- SlugValidator
- MoneyValidator
- IpValidator
- AssociationLengthValidator
- AbsolutePathValidator
- UriComponentValidator
- ColorValidator
- EanValidator ([EAN-8 & EAN-13](http://en.wikipedia.org/wiki/International_Article_Number_(EAN)))

**Note** InnValidator and other Russian specific validators could be found at [validates_russian](https://github.com/asiniy/validates_russian) gem

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'validates'
```

Or install it yourself as:

``` bash
$ gem install 'validates'
```

## Usage

For most of the validators you just want to add this line to your model:
``` ruby
validates :attribute, <validator_underscore>: true
```
where `<validator_underscore>` is an underscored, lowercase form from the validator's name (see the examples section below).

### AssociationLengthValidator

Because this is the successor of ActiveModel::Validations::LengthValidator
validator, it inherits all the options of the latter, such as `:is`, `:minimum`,
`:maximum`, etc. Another option, which you may be interested in is `:select` option,
which allows you to filter the collection of the associated objects.

## Examples

``` ruby
class User < ActiveRecord::Base
  validates :email, :email => true
  validates :site, :url => true, :allow_blank => true
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

class Content < ActiveRecord::Base
  # Validates URI component.
  # URI component must be of the following type:
  # :ABS_URI, :REL_URI, :URI_REF, :ABS_URI_REF, :REL_URI_REF, :ESCAPED, :UNSAFE, :SCHEME,
  # :USERINFO, :HOST, :PORT, :OPAQUE, :REGISTRY, :ABS_PATH, :REL_PATH, :QUERY or :FRAGMENT.
  # These types are provided URI library. For more info see URI::DEFAULT_PARSER.regexp.

  validates :path, :uri_component => { :component => :ABS_PATH }
end

```

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Credits

Originally written by Mikhail Stolbov. Maintained by kaize.

Thank you to all our amazing [contributors](http://github.com/kaize/validates/contributors)!

## License

validates is Copyright © 2012-2014 Mikhail Stolbov and kaize. It is free
software, and may be redistributed under the terms specified in the LICENSE
file.
