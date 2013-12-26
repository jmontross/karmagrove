class CharitiesController < ApplicationController



  def new
    @charity = Charity.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

    # POST /products
  # POST /products.json
  def create
    @charity = Charity.new(params[:charity])

    respond_to do |format|
      if @charity.save
        format.html { redirect_to @charity, notice: 'charity was successfully created.' }
        format.json { render json: @charity, status: :created, location: @charity }
      else
        format.html { render action: "new" }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end
end
