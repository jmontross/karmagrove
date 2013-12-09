class CharityPayment < ActiveRecord::Base
  has_many :donations
  belongs_to :charity

  attr_accessible :payment_provider, :payment_reference, :state, :charity_id, :amount


  def pay(amount = self.amount, description="distribution from karmagrove")
    return "failure: no charity uri, must create charity" unless self.charity_id
    @charity = Charity.find(self.charity_id)
    begin
      @customer = Balanced::Customer.find @charity.uri
    rescue
      return "failure"
    end
    # @customer.should.exist
    response = @customer.credit(:amount => amount, :description => description)
    self.payment_provider = "balanced"
    self.payment_reference = response.uri
    self.state = response.state
    self.save!
    if self.state == "cleared"
      return "success"
    else
      return "failure"
    end
  end
end
