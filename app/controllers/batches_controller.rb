class BatchesController < InheritedResources::Base


  def show
    @batch = Batch.find(params[:id])
    puts params[:id]
    charity_ids = BatchCharity.where(:batch_id => params[:id].to_i).map {|batch_charity| batch_charity.charity_id }
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



end
