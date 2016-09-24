# Postcode.io Ruby Client

Wrapper for Postcode.io API.

* [API Documentation](http://postcodes.io/docs)

## Requirements

* Ruby `> 1.9.x`

## Installation

Add this line to your application's Gemfile:

    # Rubygems
    gem "postcodesio"

    # Github
    gem "postcodesio", git: "https://github.com/ChuckJHardy/Postcodesio.git", branch: :master

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postcodesio

## Configuration

``` ruby
Postcodesio.configure do |config|
  config.base_url = "https://api.postcodes.io/"
  config.verbose = true
  config.logger = Rails.logger
end
```

Some configuration can be set by environment variables:

``` bash
POSTCODESIO_BASE_URL="https://api.postcodes.io/"
POSTCODESIO_TIMEOUT=60000
POSTCODESIO_VERBOSE=true
```

* `base_url` sets the Postcodes.io API url `https://api.postcodes.io/`
* `timeout` sets the Postcodes.io API request timeout `3600`
* `verbose` should all output be printed to STDOUT `false`
* `logger` Logger object. `Logger`

## Usage

#### Reverse Geolocate

Valid Response

``` ruby
results = Postcodesio.locate(lat: 50.827152, lon: -3.591682) # => [#<Postcodesio::Result:0x007ffd7d132950>]
results.first.as_hash # => { ... }

# Methods are dynamically defined based on headers. For example:
results.first.methods.sort # => [..., :postcode, :country]
results.first.postcode # => "EX17 4AZ"
```

## PAW File

[Download](./Pawfile) for [PAW](https://paw.cloud/)

## Testing

    # Includes Rubocop
    $ bin/test

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/chuckjhardy/Postcodesio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
