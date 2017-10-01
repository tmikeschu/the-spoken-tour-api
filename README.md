[![Build Status](https://travis-ci.org/tmikeschu/the-spoken-tour-api.svg?branch=master)](https://travis-ci.org/tmikeschu/the-spoken-tour-api)

# API for [The Spoken Tour](http://www.thespokentour.com/)

![](https://www.thespokentour.com//static/media/spoken-logo.6fa3a5cd.jpg)

This is a simple API built with Rails and for a front-end React application.

## Links

*clicky clicky clicky*

The repo for this API's front end buddy lives [here](https://github.com/tmikeschu/spoke-n).

Find the endpoints [here](http://spoken-api.herokuapp.com/) (you'll need a key, and prepare to be blown away by some AMAZING styling).

## Setup

To get your machine and this code friendly and acquainted:

Clone this repository using your preferred method and `cd` into it. If you're not sure, I
recommend the SSH route:

```
git clone git@github.com:tmikeschu/spoke-n-api.git
cd spoke-n-api
bundle install
rake db:{create,migrate}
rake route_pins:load
```

## Testing

First things first: get a dopamine hit from a verdant test suite! Run the tests with:

```
bundle exec rspec
```

then *read* the tests to get oriented with the application.

## Local Development

What fun is setting up and running tests if you can't do some of your own stuff?

```
rails s
open http://localhost:3000
```

## Stack

Languages: [Ruby](http://ruby-doc.org/) `2.3.3`
DBs: [Postgresql](https://www.postgresql.org/docs/)
Frameworks: [Rails](http://guides.rubyonrails.org/) (API only) `5.0.1`
Major Libraries:
DevOps: [Heroku](https://www.heroku.com/home)
Tools:
CI: [Travis CI](https://travis-ci.org/)

## Style

When contributing to code, be the tofu. In other words, take on the style of the
existing code. Here are some main approaches I follow:

* General [Ruby](https://github.com/bbatsov/ruby-style-guide) and [Rails](https://github.com/bbatsov/rails-style-guide) best practices

## Contributing

Interested in helping out?

1. Reach out to me and say hello! I'd love to hear about what you're interested
   in.

2. Once we've confirmed what you can work on, fork this repo and work on you
   masterpiece.

3. Once your work is done, squash your work to a single commit, and open a PR
   from your feature branch to this repo's master branch.

