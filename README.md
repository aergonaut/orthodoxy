# Orthodoxy

**Orthodoxy** is a Rails plugin that allows you to give your users the ability to define their own custom validations on your models.

## Installation

Add it to your Gemfile:

```
gem 'orthodoxy', git: 'https://github.com/aergonaut/orthodoxy.git'
```

Then run `bundle install` to install it.

Next run the generator to install the required files to your application:

```
$ rails g orthodoxy:install
```

## Configuration

Orthodoxy depends on one configuration parameter, which you set in its initializer. This will be located in `config/initializers/orthodoxy.rb` if you ran the generator.

```ruby
Orthodoxy.rule_set_class = "RuleSet"
```

Set this to the name of the class you will use to represent your rule sets. It's important to use the string version of the class name, not the class constant itself. Read on to learn more about rule sets and how Orthodoxy uses them.

## Usage

### Rules

Rules form the foundation of Orthodoxy. Each rule encapsulates a single field to validate and the validator to use for validation.

The validators are classes that follow the ActiveModel::Validator interface.

Out of the box, Orthodoxy will use the validators that come built-in with ActiveModel. If you want to define your own custom validators, add their names to Orthodoxy in the intializer:

```ruby
Orthodoxy.validator_classes << "MyCustomValidator"
```

### Rule sets

A rule set is a package of rules that should be applied to a record. Rule sets must contain logic to match themselves to records. While Orthodoxy comes bundled with a Rule model, you should define your own RuleSet model. Orthodoxy includes a simple mixin that you can include to give your model the required interface:

```ruby
class RuleSet < ActiveRecord::Base
  include Orthodoxy::ActsAsRuleSet
end
```

#### RuleSet.applicable_to(record)

This method should return an ActiveRecord relation of rule sets that are applicable to the given record. By default this returns all rule sets, but you should customize this by overriding the method in your class.

### Adding validations to your models

To add validations to your models, simply add the `has_custom_validations` macro to the model.

```ruby
class Entry < ActiveRecord::Base
  has_custom_validations
end
```

This will add a validation hook that will query your rule sets and apply the applicable rules to your model. That's it!

## Contributing

1. Fork the project
2. Make a new branch (`git checkout -b my-feature`)
3. Push your changes to GitHub (`git push -u origin my-feature`)
4. Open a Pull Request!

## License

The MIT License (MIT)

Copyright (c) 2015 Chris Fung

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.