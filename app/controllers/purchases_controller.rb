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

end
