class BuddhasController < InheritedResources::Base

  def dharmaya
    if Product.find_by_name "Teaching of Buddha" == nil 
       @product = Product.create!(:name => "Teaching of Buddha", :image_url => "/assets/buddha_green.jpg", :price => 500 ) 
    else
       @product = Product.find_by_name "Teaching of Buddha"
   end
    @purchase = Purchase.create!(:product_id => @product.id)
    # @donation = @donation.create | donation occurs right away?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end

  end

  def update  	
  	create
  end

  def create

     @purchase = Purchase.find(params[:purchase][:id]) 
     @purchase.product_id = params[:product_id] || params[:product][:id]

    @product = Product.find @purchase.product_id 
    @purchase.save
  
    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    Rails.logger.info "stripe token #{token} "


    # Create the charge on Stripe's servers - this will charge the user's card
    if params[:email]
      @email = params[:email]
      if User.find_by_email @email
        @user =  User.find_by_email @email
      else
        @user = Buyer.create @email
      end
        @user.provider="stripe"
        @user.uid = @stripe_customer.id
        # @stripe_customer = Stripe::Customer.find_by_email @email
        # @stripe_customer ||= Stripe::Customer.create(
        #                       :card => token,
        #                       :description => @email
        #                       )    
    end

    #   customer = Stripe::Customer.create(
    #     :card => token,
    #     :description => "payinguser@example.com"
    #   )
      
    #   # Charge the Customer instead of the card
    #   Stripe::Charge.create(
    #       :amount => 1000, # in cents
    #       :currency => "usd",
    #       :customer => customer.id
    #   )      
    begin
      # replace with @stripe_customer
      Stripe.api_key = "sk_test_B5RUJ3ZgW7BnB5VKp1vNbE7e"
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100).to_i , # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => @email
      )
    rescue Stripe::CardError => e
      # The card has been declined
      Rails.logger.info "error: #{e.message}"
    end
  
    # @purchase.stripe_customer_token = charge.id
  
    if @purchase.save_with_payment({:purchase_id => @purchase.id})
      mailer_params = {user: @user}
      Notifier.send_purchase_email mailer_params 
      redirect_to [@product, @purchase], :url => {:action => "index"}, :notice => "Thank you for purchasing!"
    else
      render :new
    end
  end
end
