# Db Nyc

## Description

Db NYC is a visualization of the noise pollution in New York City. The app was created using Ruby on Rails and maps the location of 311 noise complaints, emergency services, social check-ins, and social venue reviews to create a dynamic heat-map of noise broken down over a 24 hour period. 

## Screenshots

![dB NYC homepage](screenshots/decibel-nyc-homepage.png "Home page for dB NYC showing the heat-map produced by aggregating all the data")
Home page for dB NYC showing the heat-map produced by aggregating all the available data.

![dB NYC menu](screenshots/decibel-nyc-menu.png "The heat-map can be dynamically re-drawn by selecting noise types and time of day")
The noise "heat-map! can be dynamically re-drawn by selecting specific noise types and time of day


## Background

Inspired by the NYC Open Data program and the [Human Wasteland](http://jennz0r.github.io/wasteland/#) project. 

## Features

+ Dynamic map generation using data sourced from NYC Open Data, Google Places API, Foursquare API, and the Yelp API.
+ Heat-map created using the Google Maps API.
+ Manipulates a Postgres database with over 200k rows of data.
+ Bootstrap for responsive and modular design.

## Usage

Visit [decibel-nyc](https://decibel-nyc.herokuapp.com/) to try-out the app. Users can filter the heat-map based on time of day and specific noise type

## Development/Contribution

Please feel free to contribute to the project. 

## Future

The app was built to update periodically by querying the NYC Open Data API, however, currently the app is restricted by Heroku database limitations.  

## Developers

Made with &hearts; by // Flatiron School Students:

- [Liz Lovero](https://github.com/lizlove)

- [Heather Petrow](https://github.com/hpetrow)

- [Walter Beller-Morales](https://github.com/walterbm)

## License

Db NYC is MIT Licensed. See LICENSE for details.