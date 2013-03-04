class PurchasesController < ApplicationController



def index
   @purchases = Purchase.all

   respond_to do |format|
     #format.html  # index.html.erb
     format.json { render json: @purchases }
   end
  #format.html "hello"
end

def show
   @purchase = Purchase.find(params[:id])
   respond_to do |format|
     format.html
     format.svg  { render :qrcode => request.url, :unit => 10 }
     format.json { render json: @purchase }
   end
end

# GET /products/new
# GET /products/new.json
  def new
    @product = Product.find(params[:product_id])
    @purchase = Purchase.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

#POST /products/:id/purchases
  def create
  @purchase = Purchase.new(params[:purchase])
  @purchase.product_id = params[:product_id]
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
  end

  # @purchase.stripe_customer_token = charge.id

  if @purchase.save_with_payment
    redirect_to [@product, @purchase], :url => {:action => "index"}, :notice => "Thank you for purchasing!"
  else
    render :new
  end
end

end
