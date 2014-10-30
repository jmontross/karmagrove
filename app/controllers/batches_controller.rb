class BatchesController < InheritedResources::Base


  def show
    @batch = Batch.find(params[:id])
    @id = params[:id]
    puts params[:id]
    charity_ids = BatchCharity.where(:batch_id => params[:id].to_i).map {|batch_charity| batch_charity.charity_id }
    @charity_ids = charity_ids
    @charities = Charity.find(charity_ids)
    if @charities.nil?
      @charities = Charity.find [99837, 99838, 99839]
    end
    @batch_charities = BatchCharity.all
    @product_id = Product.where(:name => "Karma Coin").first.id
    @purchase = Purchase.new(:product_id => @product_id)
    @disable_nav = true
    @disable_sidebar = true
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => request.url.gsub('.svg','.html'), :unit => 10 }
    end
  end

  def donate
    @batch = Batch.find(params[:id])
    @batch = Batch.find(params[:id])
    @id = params[:id]
    puts params[:id]
    charity_ids = BatchCharity.where(:batch_id => params[:id].to_i).map {|batch_charity| batch_charity.charity_id }
    # puts "charity_ids = #{charity_ids}"
    # Rails.logger.info "charity_ids #{charity_ids}"
    @charities = Charity.find(charity_ids)
    if @charities.nil?
      @charities = Charity.find [99837, 99838, 99839]
    end
    @batch_charities = BatchCharity.all
    @product_id = Product.where(:name => "Karma Coin").first.id
    @purchase = Purchase.new(:product_id => @product_id)
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => request.url.gsub('.svg','.html'), :unit => 10 }
    end
  end


  # PUT /batches/1
  # PUT /batches/1.json
  def update
    @batch_id = params[:batch_id]
    @batch = Batch.find(@batch_id)

    respond_to do |format|

      if params[:batch]  
        @batch.state = params[:batch][:state]
        @batch.sales = params[:batch][:sales].to_i
        @batch.batch_name = params[:batch][:batch_name]
        @batch.save
      end
      
      if params[:batch][:batch_charity_ids]
        if params[:batch][:batch_charity_ids].length > 2 
          BatchCharity.delete_all(:batch_id => @batch_id)  
        end
        params[:batch][:batch_charity_ids].each do |charity_id| 
          unless charity_id == ""
            BatchCharity.create!(:batch_id => @batch_id,:charity_id => charity_id)  
          end
        end
        format.html { redirect_to "/admin/batches/#{@batch_id}/edit", notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end
end

