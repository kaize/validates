# Validates

## Summary

Email, Slug, Url simple format validators for Rails 3

## Installing

Add this to your `Gemfile`:

    gem "validates"

## Usage

    model User < ActiveRecord::Base
      validate :email, :presence => true, :email => true
      validate :site, :presence => true, :url => true, :allow_nil => true
    end

    model Page < ActiveRecord::Base
      validate :slug, :presence => true, :slug => true
    end


## Relise notes

0.0.2 - Fixed email validator. If email not presence, should be validate anyway.

## Similar

* http://github.com/balexand/email_validator
* http://github.com/cesario/activevalidators
* https://rubygems.org/gems/date_validator
* and more...
