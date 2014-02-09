class DonationsController < ApplicationController


  def new
    @batch_id = params[:batch_id]
    @batch = Batch.find(@batch_id)
    charity_ids = BatchCharity.where(:batch_id => @batch_id.to_i).map {|batch_charity| batch_charity.charity_id }
    @charity_ids = charity_ids
    @charities = Charity.find(charity_ids)

    if @charities.nil?
      @charities = Charity.find [99837, 99838, 99839]
    end

    @batch_charities = BatchCharity.all
    @batch.batch_products
    @product_id = Product.where(:name => "Karma Coin").first.id
    @purchase = Purchase.create(:product_id => @product_id)
    @disable_nav = true
    @disable_sidebar = true
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => request.url.gsub('.svg','.html'), :unit => 10 }
    end

  end

  def index
    @donations = Donation.all
     respond_to do |format|
      format.html
      format.svg  { render :qrcode => request.url.gsub('.svg','.html'), :unit => 10 }
    end

  end
end
