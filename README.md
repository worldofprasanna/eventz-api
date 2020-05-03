# app

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Backend for Event Manager app

## Table of Contents

- [app](#app)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
  - [Usage](#usage)
  - [Maintainers](#maintainers)
  - [License](#license)

## Install

1. Install ruby, rails
2. To install dependencies,
```
bundle install
```
3. To setup the database,
```
bundle exec rails db:setup
```
4. To run the database migrations,
```
bundle exec rails db:migrate
```
5. To populate the dummy data from data/ folder
```
bundle exec rails data:populate_all
or
type=PromoCode bundle exec rails data:populate
```
6. After populating the data run the command in rails console,
```
Conference.all.each {|c| c.set_slug }
```
this will set slug for all the conferences.

## Usage

1. Start the server
```
bundle exec rails s
```

## Maintainers

[@worldofprasanna](https://github.com/worldofprasanna)
[@intrepidkarthi](https://github.com/intrepidkarthi)

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2020 Prasanna, Karthikeyan
