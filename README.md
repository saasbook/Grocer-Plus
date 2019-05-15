# Grocer-Plus
[![Maintainability](https://api.codeclimate.com/v1/badges/b7d4f5719125a5f5a47b/maintainability)](https://codeclimate.com/github/omidzargham/Grocer-Plus/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b7d4f5719125a5f5a47b/test_coverage)](https://codeclimate.com/github/omidzargham/Grocer-Plus/test_coverage)
[![Build Status](https://travis-ci.org/omidzargham/Grocer-Plus.svg?branch=master)](https://travis-ci.org/omidzargham/Grocer-Plus)

http://grocer-plus.herokuapp.com/

https://www.pivotaltracker.com/n/projects/2317091

## Local Development
This repo makes use of the Edamam API, which the requires your APP_ID and APP_KEY as environment variables from when you sign up with the API. 
Clone this repo, then run:
```
bundle install --without production
export APP_ID={YOUR APP ID}
export APP_KEY={YOUR APP KEY}
bin/rake db:migrate RAILS_ENV=development
rails server
```
