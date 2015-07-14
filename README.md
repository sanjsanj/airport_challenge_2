#Airport Challenge

[![Build Status](https://travis-ci.org/sanjsanj/airport_challenge_2.svg?branch=master)](https://travis-ci.org/sanjsanj/airport_challenge_2)  [![Coverage Status](https://coveralls.io/repos/sanjsanj/airport_challenge_2/badge.svg?branch=master&service=github)](https://coveralls.io/github/sanjsanj/airport_challenge_2?branch=master)  [![Code Climate](https://codeclimate.com/github/sanjsanj/airport_challenge_2/badges/gpa.svg)](https://codeclimate.com/github/sanjsanj/airport_challenge_2)

----------

###Task:

Test drive the creation a set of classes/modules to satisfy all the below user stories.

----------

###User Stories:

```
As a pilot
So that I can arrive at my specified destination
I would like to land my plane at the appropriate airport

As a pilot
So that I can set off for my specified destination
I would like to be able to take off from the appropriate airport

As an air traffic controller
So that I can avoid collisions
I want to be able to prevent airplanes landing when the airport if full

As an air traffic controller
So that I can avoid accidents
I want to be able to prevent airplanes landing or taking off when the weather is stormy
```

---------

###Tests:

```
Running RuboCop...
8 files inspected, no offenses detected

Airport
  capacity
    defaults to 6 if not specified
    can be set on instantiation
    can be changed after instantiation
  landing
    can land a plane
  take off
    can take a plane off
  traffic control
    when airport is full
      does not allow a plane to land
    when weather conditions are stormy
      does not allow a plane to land
      does not allow a plane to take off

Grand Finale
  enough planes can be created to fill the airport
  6 planes can land at the airport
  plane is denied landing permission when airport is full
  6 landed planes have status: landed
  after all 6 planes takeoff there are no more landed planes
  after all 6 planes takeoff their status is 'flying'

Plane
  is flying when created
  can request to land
  can land
  is landed after landing
  can not land while landed
  can request to takeoff
  can take off
  is flying after take off
  can not take off if not landed

23 examples, 0 failures
```

---------

###Notes:

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs
