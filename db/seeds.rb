# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create({
    :name => "Joy Coin 6 pack",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "20.00"
  })

Product.create({
    :name => "Joy Coin 6 pack",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "13.00"
  })

Product.create({
    :name => "Joy Coin 10 pack",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "26.00"
  })

Product.create({
    :name => "Joy Coin Single",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "2.50"
  })

User.create( { "email"=>"admin@example.com" })

Purchase.create(
  {
    "donation_id"=>nil,
    "product_id"=>1,
    "seller_id"=>1
  })