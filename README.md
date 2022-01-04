# Capricc-Io

[![Build Status](https://github.com/maxbarsukov/capricc-io/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/maxbarsukov/capricc-io/actions/workflows/main.yml)
[![Codecov](https://codecov.io/gh/maxbarsukov/capricc-io/branch/master/graph/badge.svg?token=9L8Y4N4KKW)](https://codecov.io/gh/maxbarsukov/capricc-io)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/maxbarsukov/capricc-io)

![Gem Version](https://img.shields.io/gem/v/capricc-io)
![Gem Downloads](https://img.shields.io/gem/dt/capricc-io)

***Capricc-Io*** is a tiny interpreted *prototyped-based* **homoiconic** and dynamic typing language with ***Io-like messages***.

- **Everything** is an **object** in *Capricc-Io*;
- Program is just a **series of messages**;
- Objects don’t have classes, but **prototypes**, their parent objects;
- Messages are the only data type and also parsing representation → ***homoiconicity***;

In [lib/capriccio/stdlib](https://github.com/maxbarsukov/capricc-io/tree/master/lib/capriccio/stdlib) you can see how you can define an **if** statement or **booleans** behavior directly in *Capric-Io*;

## Installation

    $ gem install capricc-io

## Usage

Run REPL:
```bash
capio
```

or run file:
```bash
capio your_code.cio
```

## Examples of code

Prototypes & OOP:
```python
# comment

set("person", Object clone)
person set("name", "Max")
person name print
# => Max

person set("say_name", def(
  arguments print
  # => <Message @name="hello...">

  eval_arg(0) print
  # => hello...

  self name print
  # => Max
))

person say_name("hello...")
```

Conditions:
```python
if(true,
  "condition is true" print,
  "nope" print
)
# => condition is true

if(false,
  "nope" print,
  "condition is false" print
)
# => condition is false
```

Booleans:
```python
"yo" or("hi") print
# => yo

nil or("hi") print
# => hi

"yo" and("hi") print
# => hi

1 and(2 or(3)) print
# => 2
```

## Building

### Pre-reqs

To build and run this app locally you will need a few things:

- Install [Ruby](https://www.ruby-lang.org/en/) *(tested on **2.6**)*;

### Getting start

- Clone the repository
```bash
git clone --depth=1 https://github.com/maxbarsukov/capricc-io.git
```
- **Install dependencies**
```bash
cd capricc-io
bundle install
```
- **Run**
```bash
./bin/capriccio input.cio
# or
./bin/capriccio
````
- **RSpec**
```bash
bundle exec rspec
```
- **Rubocop**
```bash
bundle exec rubocop
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maxbarsukov/capricc-io. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maxbarsukov/capricc-io/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Capricc-Io project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maxbarsukov/capricc-io/blob/master/CODE_OF_CONDUCT.md).
