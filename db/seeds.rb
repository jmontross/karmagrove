# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
batch = Batch.create!(:batch_name => "cruzio karma")

c1 = Charity.create!(:legal_name => "Grey Bears", :state => "CA", :deductibility_status_description => "Grey bears is a 501 3(c) charity that feeds the hungry and elderly in Santa Cruz county.  They run primarly off of volunteers and more can be learned about them at http://www.greybears.org/")
c2 = Charity.create!(:legal_name => "Elephants and Bees", :state => "Africa", :deductibility_status_description => "Build fences out of beehives to save elephants lives and help African farmers.  http://www.elephantsandbees.com")
c3 = Charity.create!(:legal_name => "Nuru International", :state => "Global", :deductibility_status_description => "Building the world's first self-sustaining, self-scaling, integrated development model to end extreme poverty.  http://http://www.nuruinternational.org/")

BatchCharity.create!(:batch_id => batch.id, :charity_id => c1.id)
BatchCharity.create!(:batch_id => batch.id, :charity_id => c2.id)
BatchCharity.create!(:batch_id => batch.id, :charity_id => c3.id)

product = Product.create!({
    :name => "Karma Coin",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "2.00"
})

BatchProduct.create(:product_id => product.id, :batch_id => batch.id)

Retailer.create!(:name => "Sentinel Cafe", :description => "The sentinel cafe is inside of Cruz.io in Santa Cruz")

# product = Product.create!({
#     :name => "Joy Coin Batch 1 for Cruzio",
#     :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
#     :price => "33"
#   })

# d = Donation.create!(:charity_id => c.id, :amount => 30.00, :donation_date => "Thu, 21 Mar 2013 05:13:44 UTC +00:00")
# r = Retailer.create!(:name => "cruzio cafe", :description => "that awesome cafe inside cruzio", :address => "877 Cedar St #150  Santa Cruz, CA 95060")
# p = Purchase.create!(:retailer_id => r.id, :donation_id => d.id, :product_id => product.id)
# d.purchase_id = p.id
# d.save
# Product.create({
#     :name => "Joy Coin 6 pack",
#     :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
#     :price => "20.00"
#   })

# Product.create({
#     :name => "Joy Coin 6 pack",
#     :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
#     :price => "13.00"
#   })

# Product.create({
#     :name => "Joy Coin 10 pack",
#     :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
#     :price => "26.00"
#   })

# Product.create({
#     :name => "Joy Coin Single",
#     :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
#     :price => "2.50"
#   })

# User.create( { "email"=>"admin@example.com" })

# Purchase.create(
#   {
#     "donation_id"=>nil,
#     "product_id"=>1,
#     "seller_id"=>1
#   })

# d = Donation.create!(:charity_id => c.id, :amount => 30.00, :donation_date => "Thu, 21 Mar 2013 05:13:44 UTC +00:00")