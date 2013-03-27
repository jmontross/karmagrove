# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


c = Charity.create!(:legal_name => "Grey Bears", :state => "CA", :deductibility_status_description => "Grey bears is a 501 3(c) charity that feeds the hungry and elderly in Santa Cruz county.  They run primarly off of volunteers and more can be learned about them at http://www.greybears.org/")

product = Product.create!({
    :name => "Joy Coin Batch 1 for Cruzio",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "33"
  })

d = Donation.create!(:charity_id => c.id, :amount => 30.00, :donation_date => "Thu, 21 Mar 2013 05:13:44 UTC +00:00")
r = Retailer.create!(:name => "cruzio cafe", :description => "that awesome cafe inside cruzio", :address => "877 Cedar St #150  Santa Cruz, CA 95060")
Purchase.create!(:retailer_id => r.id, :donation_id => d.id, :product_id => product.id)

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