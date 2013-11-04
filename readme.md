README
=======

What is this?
-------------
This is my final project for my Algorithms class at Lewis & Clark College. It's a web application that will dynamically generate a climbing itinerary, or ticklist, based on the preferences that you specify. It's based on Rails 4.0 and uses d3.js for the graph visualization and Bootstrap 3.0 for the UI.

Testing
---------
This project has test coverage via Ruby's Test::Unit framework, and any changes automatically kick off a test via Travis-CI. Below, you can see the current testing state of the repository. Detailed testing results and test history can be found at [https://travis-ci.org/qrohlf/rockthang](https://travis-ci.org/qrohlf/rockthang).
[![Build Status](https://travis-ci.org/qrohlf/rockthang.png)](https://travis-ci.org/qrohlf/rockthang)

Backend
--------
The project currently is set up to run on a free Heroku instance at [rockthang.herokuapp.com](http://rockthang.herokuapp.com/). The tests themselves can be found in the [test directory](https://github.com/qrohlf/rockthang/tree/master/test) of this repo.