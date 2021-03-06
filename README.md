# Minitest::SubTestCase

`minitest-sub_test_case` makes `sub_test_case` method available in minitest/test.

[![Build Status](https://travis-ci.org/y-yagi/minitest-sub_test_case.svg?branch=master)](https://travis-ci.org/y-yagi/minitest-sub_test_case)
[![Gem Version](https://badge.fury.io/rb/minitest-sub_test_case.svg)](http://badge.fury.io/rb/minitest-sub_test_case)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minitest-sub_test_case'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-sub_test_case

## Usage

```ruby
require 'test_helper'

class UserTest < Minitest::Test
  sub_test_case 'validation' do
    def test_invalid_name
      assert false
    end

    def test_invalid_email
      assert false
    end
  end

  def test_user_can_create_todo
    assert false
  end
end
```

You can also use it with the Rails test class.

```ruby
require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test 'recently updated pages group by date' do
    ...
  end

  test 'find page when use valid title' do
    ...
  end

  sub_test_case 'validation' do
    test 'validate error when set invalid title' do
      ...
    end
  end
end
```

```ruby
require 'test_helper'

class BooksTest < ActionDispatch::IntegrationTest
  setup do
    ...
  end

  sub_test_case('create book with author') do
    setup do
      ...
    end

    test "fail" do
      ...
    end
  end

  test "success" do
    ...
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/y-yagi/minitest-sub_test_case. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

