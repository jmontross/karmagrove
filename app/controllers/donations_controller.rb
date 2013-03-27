class DonationsController < ApplicationController
  def index
    @donations = Donation.all
    @charities = []
    @retailers = []
    @donations.each do |donation|
      @charities << Charity.find(donation.charity_id)
      if donation.purchase_id
        purchase = Purchase.find(donation.purchase_id)
        if purchase
          @retailers = Retailer.find purchase.retailer_id
        end
      end
    end

    respond_to do |format|
      format.html
    end
  end
  # index
end
# DonationsController
