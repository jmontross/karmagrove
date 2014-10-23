Karma Grove
===========

This is [Karma Grove](http://www.karmagrove.com), an experiment in conscious commerce

Mission
===========

We are empowered to improve our world by donating the profits of a transaction. A portion of the money you exchange for a purchase goes right to a local charity of your choice.  We give exactly 50% of the profits from your sale where you choose. This is your right for buying anything from karma grove. We also give our the portion to charities we like, and we are transparent about where the money goes so you can help karma grow.

Quick Start
===========

```
$ git clone git@github.com:jmontross/karmagrove.git
$ cd karmagrove
$ bundle install
$ export RAILS_ENV=development; bundle exec rake db:seed
$ bundle exec rake db:seed
$ bundle exec rails s

Libv8 problems?  

    brew install libv8
    gem install libv8 -v     3.11.8.17 -- --with-system-v8
    
    pg problems? 
    brew install postgresql
    
    rmagick problems? 
    brew install imagemagick

```

Quick Start with vagrant
===========

This is a work in progress and describes the ideal.
A vagrant file is provided
ubuntu 12.04 if you want OS that is tested
for info see vagrantup.com
in short,  install vagrant from vagrantup.com, install virtualbox, and get ubuntu 12.04 with
vagrant box add precise64 http://dl.dropbox.com/u/1537815/precise64.box
you need berkshelf also for some plugins..
vagrant plugin install --plugin-prerelease --plugin-source https://rubygems.org vagrant-berkshelf
https://github.com/berkshelf/vagrant-berkshelf/issues/122

````
git clone git@github.com:jmontross/karmagrove.git
bundle install | gem install vagrant
vagrant up
````
You should be able to access the application on
localhost:8081
or
localhost:8082 for https


Contribute
===========
tackle an issue from https://github.com/jmontross/karmagrove/issues
Join hipchat https://www.hipchat.com/invite/80443/cb97666cdcc40d22c4ffff1b0e9dc76b"

Dependencies
===========

ruby 1.9.3 because it is not tested in 1.8.7
image magick for the qr code generation

Run tests
===========

```
$ export RAILS_ENV=test; bundle exec rake db:migrate
```

To test everything

```
$ bundle exec rspec spec
```
To test models

```
$ bundle exec rspec spec/models/
```

