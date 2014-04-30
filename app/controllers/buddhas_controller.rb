class BuddhasController < InheritedResources::Base

  def dharmaya
    @product = Product.find_by_name "Teaching of Buddha" ||  Product.create!(:name => "Teaching of Buddha", :image_url => "/assets/buddha_green.jpg")
    @purchase = Purchase.create!(:product_id => @product.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end

  end

end
