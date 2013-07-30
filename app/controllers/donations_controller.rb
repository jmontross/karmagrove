class DonationsController < ApplicationController
  def index
    @donations = Donation.all
    @charities = {}
    @retailers = []
    @donations.each do |donation|
      @charities[donation.id] = Charity.find(donation.charity_id)
      if donation.purchase_id
        purchase = Purchase.find(donation.purchase_id)
        if purchase
          if Retailer.exists? purchase.retailer_id
            @retailers = Retailer.find purchase.retailer_id
          else
            @retailers = []
          end
        end
      end
    end

    respond_to do |format|
      format.html
    end
  end
  # index

  # batches/{batch_id}/donations/new.svg
  def new
    @disable_nav = true
    @disable_sidebar = true
    @batch_id = params[:batch_id]
    @batch = Batch.find(@batch_id)
    puts @batch_id
    charity_ids = BatchCharity.where(:batch_id => @batch_id).map {|batch_charity| batch_charity.charity_id }
    @charities = Charity.find(charity_ids)
    @product_id = Product.where(:name => "Karma Coin").first.id
    @purchase = Purchase.new(:product_id => @product_id,:batch_id => @batch_id, :retailer_id => 1)
    @purchase.save
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => request.url.gsub('.svg','.html'), :unit => 10 }
    end
  end

  def show
    @disable_nav = true
    @disable_sidebar = true
    bitly = Bitly.new('o_t7uc2iai2','R_46b43d229bccf6d317eca02d76d48818')
    if request.url.match 'localhost:3000'
      url = request.url.gsub('localhost:3000','www.karmagrove.com')
      u = bitly.shorten(url)
    else
      u = bitly.shorten(request.url)
    end
    @short_url = u.short_url
    @short_url ||= bitly.shorten("http://www.karmagrove.com/batches/1/donations/new.svg").short_url
    Rails.logger.info @short_url
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => request.url.gsub('.svg','.html'), :unit => 10 }
    end
  end

end
# DonationsController

