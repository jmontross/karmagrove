Karma Grove
===========

This is [Karma Grove](www.karmagrove.com), an experiment in conscious commerce

Mission
===========

We are empowered to improve our world by donating the profits of a transaction. A portion of the money you exchange for a purchase goes right to a local charity of your choice.  We give exactly 50% of the profits from your sale where you choose. This is your right for buying anything from karma grove. We also give our the portion to charities we like, and we are transparent about where the money goes so you can help karma grow.

Quick Start
===========

```
$ git clone git@github.com:jmontross/karmagrove.git
$ cd karmagrove
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
$ bundle exec rails s
```

Contribute
===========
tackle an issue from https://github.com/jmontross/karmagrove/issues

Dependencies
===========

ruby 1.9.3 because it is not tested in 1.8.7
image magick for the qr code generation

Run tests
===========

```
$ export RAILS_ENV=test;bundle exec rake db:migrate
```

To test everything

```
$ bundle exec rspec spec
```
To test models

```
$ bundle exec rspec spec/models/
```