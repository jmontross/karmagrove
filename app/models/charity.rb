class Charity < ActiveRecord::Base
  # ein should be unique..

  # http://apps.irs.gov/app/eos/forwardToPub78DownloadLayout.do
  # http://apps.irs.gov/app/eos/forwardToPub78Download.do
  attr_accessible :city, :country, :deductibility_status, :deductibility_status_description, :ein, :legal_name, :state, :uri
  has_many :donations


  def total_donations
    self.donations.sum(:amount)
  end

  def payment_notification
    puts "imagine that an email is sent to the contact at the charity"
  end
  # def balanced_customer
  #   customer.credit(:amount => 500, :description => "awesome credit")
  # end

end
