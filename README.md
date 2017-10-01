[![Build Status](https://travis-ci.org/tmikeschu/the-spoken-tour-api.svg?branch=master)](https://travis-ci.org/tmikeschu/the-spoken-tour-api)

# API for [The Spoken Tour](http://www.thespokentour.com/)

This is a simple API built with Rails and for a front-end React application.

The repo for this API's front end buddy lives [here](https://github.com/tmikeschu/spoke-n).

Find the endpoints [here](http://spoken-api.herokuapp.com/) (you'll need a key, and prepare to be blown away by some AMAZING styling).

### Environment Setup

```
git clone git@github.com:tmikeschu/spoke-n-api.git
cd spoke-n-api
bundle install
rake db:{create,migrate}
rake route_pins:load
clear & rspec
open http://localhost:3000
```


