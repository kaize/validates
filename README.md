# Validates

[![Build Status](https://travis-ci.org/kaize/validates.png)](https://travis-ci.org/kaize/validates)

Simple format validators for Rails 3

## Installation

Add this line to your application's Gemfile:

    gem 'validates'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'validates'

## Usage

Availables validators: AssociationLength, Email, Existence, Slug, Url, Money

    model User < ActiveRecord::Base
      validates :email, :email => true
      validates :site, :url => true, :allow_blank => true
      validates :inn, :inn => true   
    end

    model Company < ActiveRecord::Base
      # note AssociationLengthValidator is inherited from ActiveModel::Validations::LengthValidator
      # http://api.rubyonrails.org/classes/ActiveModel/Validations/LengthValidator.html
      # so you can easily use standard options like :is (:==), :minimum (:>=), :maximum (:<=)

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

    model Page < ActiveRecord::Base
      validates :slug, :slug => true
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

run tests:

    turn -Itest test/lib
