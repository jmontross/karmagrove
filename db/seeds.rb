# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(:username => "Emanuel")

batch = Batch.create!(:batch_name => "cruzio karma")
batch2 = Batch.create!(:batch_name => "cruzio karma second")
batch3 = Batch.create!(:batch_name => "cruzio karma third")

c1 = Charity.create!(:legal_name => "Grey Bears", :state => "CA", :deductibility_status_description => "Grey bears is a 501 3(c) charity that feeds the hungry and elderly in Santa Cruz county.  They run primarly off of volunteers and more can be learned about them at http://www.greybears.org/")
c2 = Charity.create!(:legal_name => "Elephants and Bees", :state => "Africa", :deductibility_status_description => "Build fences out of beehives to save elephants lives and help African farmers.  http://www.elephantsandbees.com")
c3 = Charity.create!(:legal_name => "Nuru International", :state => "Global", :deductibility_status_description => "Building the world's first self-sustaining, self-scaling, integrated development model to end extreme poverty.  http://http://www.nuruinternational.org/")


# Make batch charities so each batch has three charities from which customers may choose
BatchCharity.create!(:batch_id => batch.id, :charity_id => c1.id)
BatchCharity.create!(:batch_id => batch.id, :charity_id => c2.id)
BatchCharity.create!(:batch_id => batch.id, :charity_id => c3.id)

BatchCharity.create!(:batch_id => batch2.id, :charity_id => c1.id)
BatchCharity.create!(:batch_id => batch2.id, :charity_id => c2.id)
BatchCharity.create!(:batch_id => batch2.id, :charity_id => c3.id)

BatchCharity.create!(:batch_id => batch3.id, :charity_id => c1.id)
BatchCharity.create!(:batch_id => batch3.id, :charity_id => c2.id)
BatchCharity.create!(:batch_id => batch3.id, :charity_id => c3.id)

# Flagship product Karma Coin
product = Product.create!({
    :name => "Karma Coin",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "2.00",
    :image_url => "/assets/karma_coin_hand.gif"
})

# Attach karma coins to the batches
BatchProduct.create(:product_id => product.id, :batch_id => batch.id)
BatchProduct.create(:product_id => product.id, :batch_id => batch2.id)
BatchProduct.create(:product_id => product.id, :batch_id => batch3.id)

# Let's have an homage to our first retailer
Retailer.create!(:name => "Sentinel Cafe", :description => "The sentinel cafe is inside of Cruz.io in Santa Cruz")

# some purchases to represent our first three batches sales
Purchase.create(:batch_id => batch.id,  :purchase_price => 33)
Purchase.create(:batch_id => batch2.id, :purchase_price => 50)
Purchase.create(:batch_id => batch3.id, :purchase_price => 52)

# some donations for each batch and their purchases
Donation.create(:amount => 33.00, :charity_id => c1.id, :donation_date => "03/21/2013")
Donation.create(:amount => 50.00, :charity_id => c1.id, :donation_date => "04/02/2013")
Donation.create(:amount => 52.00, :charity_id => c1.id, :donation_date => "05/15/2013")

# actual payments made from the donations.
CharityPayment.create(
   :payment_provider => "joshua montra",  ## aka -> trust me. i copied the receipts and they show on donations page.
   :charity_id => c1.id,
   :amount => 3300
)

CharityPayment.create(
   :payment_provider => "joshua montra",  ## aka -> trust me. i copied the receipts and they show on donations page.
   :charity_id => c1.id,
   :amount => 5000
)

CharityPayment.create(
   :payment_provider => "joshua montra",  ## aka -> trust me. i copied the receipts and they show on donations page.
   :charity_id => c1.id,
   :amount => 3300
)

# Seed the donations we made on paper that show in twitter fed
# Donation.create!(:an)

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