## Hello Package BE

## Project description
API on RubyOnRails for creating conferences using vidyo.io 
## Dependencies

* Postgresql 11.2
* Ruby 2.5.1
* Rails 5.2.2.1

## Quick Start

1. Clone this repo `git clone git@github.com:account/repo.git`
2. Run setup script `bin/setup`
3. Run specs `bin/ci`
3. Run server `bin/server`

## Scripts

* `bin/setup` - build Docker image and prepare DB
* `docker-compose up --detach` - to run server locally
* `docker-compose exec app bin/rspec` - runs RSpec tests
* `docker-compose exec app bin/quality` - runs rubocop, brakeman, and bundle-audit
* `docker-compose exec app bin/doc` - generates API documentation

## Staging

deployed to [Heroku](https://fsconferenceapp.herokuapp.com/)

