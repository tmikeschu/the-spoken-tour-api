# API for [The Spoken Tour](http://www.thespokentour.com/)

This is a simple API built with Rails and for a front-end React application.

The repo for this API's front end buddy lives [here](https://github.com/tmikeschu/spoke-n).

Find the endpoints [here](http://spoken-api.herokuapp.com/) (you'll need a key, and prepare to be blown away by some AMAZING styling).

### Environment Setup

```
git clone git@github.com:tmikeschu/spoke-n-api.git
cd spoke-n-api
bundle
rake db:{create,migrate}
clear & rspec
open http://localhost:3000
```

*Note

The rake tasks are designed for KML files located in the DB. The original files I worked with resulted in over 50_000 database rows of coordinates, which Heroku didn't like. I removed the KML files to prevent this problem. If you want to load KML files to provide route coordinates for drawing Google Maps Polylines, let me know (or upload your own files to `./db`)!
