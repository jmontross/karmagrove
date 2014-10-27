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

elephants = c2

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


# Dallas Charities
batch4 = Batch.create!(:batch_name => "Dallas Full Moon Dance")
c4 = Charity.create!(:legal_name => "Genesis Womens Shelter", :state => "TX", :deductibility_status_description => "Genesis provides shelter, safety, counseling, and expert services to battered women and their children http://www.genesisshelter.org/")
c5 = Charity.create!(:legal_name => "Jubilee Center ", :state => "TX", :deductibility_status_description => "Jubilee Park is more than just the 62-block area that it occupies.  It is a collection of friends, neighbors, organizations, and communities working to inspire trust and hope in residents. http://www.jubileecenter.org/ ")

#attach Dallas ecent
BatchCharity.create!(:batch_id => batch4.id, :charity_id => c4.id)
BatchCharity.create!(:batch_id => batch4.id, :charity_id => c5.id)


# Flagship product Karma Coin
product = Product.create!({
    :name => "Karma Coin",
    :description => "Joy coins are sweet, salty, granola coins consisting of the following ingredients: Oats, Organic Hemp Seed, Honey, Nature's balance, Coconut Crystal Sugar, Walnuts, Chocolate, Coconut Butter",
    :price => "2.00",
    :image_url => "/assets/karma_coin_hand.gif"
})

product2 = Product.create!({
    :name => "Teaching of Buddha",
    :description => "Teaching of buddha on audio recorded by Andrew Allansmith",
    :price => "10.00",
    :image_url => "/assets/buddha_green.jpg"
})

ProductCharity.create!(:product_id => product2.id, :charity_id => c1.id)
ProductCharity.create!(:product_id => product2.id, :charity_id => c2.id)
ProductCharity.create!(:product_id => product2.id, :charity_id => c3.id)


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
donation1 = Donation.create(:amount => 33.00, :charity_id => c1.id, :donation_date => "03/21/2013")
donation2 = Donation.create(:amount => 50.00, :charity_id => c1.id, :donation_date => "04/02/2013")
donation3 = Donation.create(:amount => 52.00, :charity_id => c1.id, :donation_date => "05/15/2013")

## elephants and bees.  
donation4 = Donation.create(:amount => 50.00, :charity_id => elephants.id, :donation_date => "09/17/2014")

# actual payments made from the donations. Attach them to the batches!
charityPayment = CharityPayment.create(
   :payment_provider => "joshua montra",  ## aka -> trust me. i copied the receipts and they show on donations page.
   :charity_id => c1.id,
   :amount => 3300
)
BatchCharityPayment.create(:charity_payment_id => charityPayment.id, :batch_id => batch.id)

#donation1.charity_payment = charityPayment

charityPayment2 = CharityPayment.create(
   :payment_provider => "joshua montra",  ## aka -> trust me. i copied the receipts and they show on donations page.
   :charity_id => c1.id,
   :amount => 5000
)
BatchCharityPayment.create(:charity_payment_id => charityPayment2.id, :batch_id => batch2.id)
#donation2.charity_payment = charityPayment2

charityPayment3 = CharityPayment.create(
   :payment_provider => "joshua montra",  ## aka -> trust me. i copied the receipts and they show on donations page.
   :charity_id => c1.id,
   :amount => 3300
)
BatchCharityPayment.create(:charity_payment_id => charityPayment3.id, :batch_id => batch3.id)



### Dallas Dance 10/23 and 10/24

dallasMonicaAndJessica = Batch.create!(:batch_name => "Dallas Moon Dance and Contact Improv 10/23 - 10/24 2014 - all sales over $20 donated where you choose")
genesis = c4
jubilee = c5

BatchCharity.create!(:batch_id => dallasMonicaAndJessica.id, :charity_id => genesis.id)
BatchCharity.create!(:batch_id => dallasMonicaAndJessica.id, :charity_id => jubilee.id)
BatchCharity.create!(:batch_id => dallasMonicaAndJessica.id, :charity_id => elephants.id)

dance1Dallas = Donation.create(:amount => 52.00, :charity_id => c1.id, :donation_date => "05/15/2013")

#donation3.charity_payment = charityPayment3

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




# All the batches from LIVE SYSTEM
# first full moon dance receipts were 39.00 and it was split between genesis and elephants and bees.  
#  

# [#<Batch id: 4, batch_name: "Dr. Nick and Shelby help karma grow Santa Cruz", sales: nil, created_at: "2014-06-04 22:34:32", updated_at: "2014-06-04 22:55:14", state: "open">, #<Batch id: 2, batch_name: "All Coconut Oil and Honey for the caramel karma coi...", sales: 25.0, created_at: "2014-01-20 22:22:59", updated_at: "2014-01-20 22:23:29", state: "closed">, #<Batch id: 3, batch_name: "Dallas Full Moon Dance", sales: 39.0, created_at: "2014-02-16 01:31:43", updated_at: "2014-02-17 18:20:45", state: "closed">]
