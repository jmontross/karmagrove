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
  if @purchase.save_with_payment
    redirect_to [@product, @purchase], :url => {:action => "index"}, :notice => "Thank you for purchasing!"
  else
    render :new
  end
end

end
