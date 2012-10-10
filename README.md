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

Availables validators: Email, Existence, Slug, Url, Money

    model User < ActiveRecord::Base
      validates :email, :email => true
      validates :roles, :existence => true
      validates :site, :url => true, :allow_blank => true
      validates :inn, :inn => true   
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
