class AuctionItemsController < ApplicationController
  # GET /auction_items
  # GET /auction_items.json
  def index
    @auctionitems = AuctionItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auctionitems }
    end
  end

  # GET /auction_items/1
  # GET /auction_items/1.json
  def show
    @auctionitems = AuctionItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auctionitems  }
    end
  end

  # GET /auction_items/new
  # GET /auction_items/new.json
  def new
    if user_signed_in?
      @auctionitems = AuctionItem.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @auctionitems  }
      end
    else
      redirect_to("/")
    end
  end

  # GET /auction_items/1/edit
  def edit
    @auctionitems  = AuctionItem.find(params[:id])
  end

  # POST /auction_items
  # POST /auction_items.json
  def create
    @auctionitems  = AuctionItem.new(params[:auctionItem])

    respond_to do |format|
      if @auctionitems .save
        format.html { redirect_to @auctionitems , notice: 'auction_item was successfully created.' }
        format.json { render json: @auctionitems , status: :created, location: @auctionitems  }
      else
        format.html { render action: "new" }
        format.json { render json: @auctionitems .errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /auction_items/1
  # PUT /auction_items/1.json
  def update
    @auctionitems  = AuctionItem.find(params[:id])

    respond_to do |format|
      if @auctionitems .update_attributes(params[:auction_item])
        format.html { redirect_to @auctionitems , notice: 'auction_item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auctionitems .errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auction_items/1
  # DELETE /auction_items/1.json
  def destroy
    @auctionitems  = AuctionItem.find(params[:id])
    @auctionitems .destroy

    respond_to do |format|
      format.html { redirect_to auction_items_url }
      format.json { head :no_content }
    end
  end

end

