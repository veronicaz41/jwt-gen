# Jwtcli

CLI for generating Json Web Tokens (JWT's)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jwtcli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jwtcli

## Usage
The CLI takes multiple key value pairs as input, and copy the generated JWT to your clipboard.
user_id and email are required.
An example session could look like this:
```
$ jwtcli
Starting with JWT token generation.
Enter key 1: user_id
Enter user_id value: 12312
Enter key 2: email
Enter email value: something
>> Invalid email address
Enter email value: v@gmail.com
Any additional inputs? Y/n
n
The JWT has been copied to your clipboard!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
