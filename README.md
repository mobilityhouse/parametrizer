# Parametrizer

This gem extracts oem from subdomain and languages from http headers

## Installation

Add this line to your application's Gemfile:

    gem 'parametrizer', git: 'git@github.com:mobilityhouse/parametrizer.git'

And then execute:

    $ bundle

## Usage

Create initializer file `parametrizer.rb`

    Parametrizer.configure do |config|
        config.base_host = 'test.com'
    end
    
and add this line in your `application.rb` file

    config.middleware.use "Parametrizer::Middleware"
