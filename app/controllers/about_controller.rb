class AboutController < ApplicationController

def index
  #  @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
   #   format.json { render json: @products }
    end
  end

  def joy_coin
  #  @products = Product.all

    respond_to do |format|
      format.html # joy_coin.html.erb
   #   format.json { render json: @products }
    end
  end

  def karma_coin
  #  @products = Product.all

    respond_to do |format|
      format.html # joy_coin.html.erb
   #   format.json { render json: @products }
    end
  end

  def grove
  #  @products = Product.all

    respond_to do |format|
      format.html # joy_coin.html.erb
   #   format.json { render json: @products }
    end
  end


end
