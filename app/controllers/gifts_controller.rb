class GiftsController < ApplicationController


#POST /products/:id/purchases
# {"utf8"=>"✓",
#  "authenticity_token"=>"5ZSeSca80hM4tFh/MzRtHcPPUtHPD0nSEc5jn5gIPG8=",
#  "gift"=>{"purchase_price"=>"123",
#  "cost"=>"2134",
#  "products"=>["",
#  "1"],
#  "users"=>["",
#  "1"]},
#  "commit"=>"Create Gift"}
  def create
  Rails.logger.info params
  @purchase = Purchase.new(params[:purchase])
  @purchase.product_id = params[:product_id]
  # @purchase.buyer_id =

  @product = Product.find params[:product_id]
  @purchase.save

  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here https://manage.stripe.com/account
  # Stripe.api_key = "sk_test_B5RUJ3ZgW7BnB5VKp1vNbE7e"

  # Get the credit card details submitted by the form
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price * 100).to_i , # amount in cents, again
      :currency => "usd",
      :card => token,
      :description => "payinguser@example.com"
    )
  rescue Stripe::CardError => e
    # The card has been declined
    Rails.logger.info "error: #{e.message}"
  end

  # @purchase.stripe_customer_token = charge.id

  if @purchase.save_with_payment
    redirect_to [@product, @purchase], :url => {:action => "index"}, :notice => "Thank you for purchasing!"
  else
    render :new
  end
end

end
