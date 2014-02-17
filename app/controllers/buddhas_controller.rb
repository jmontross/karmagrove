class BuddhasController < InheritedResources::Base

  def dharmaya
    @product = Product.create(:name => "Teaching of Buddha")
    @purchase = Purchase.create(:product_id => @product.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end

  end

end
