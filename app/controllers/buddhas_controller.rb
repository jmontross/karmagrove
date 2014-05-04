class BuddhasController < InheritedResources::Base

  def dharmaya
    if Product.find_by_name "Teaching of Buddha" == nil 
       @product = Product.create!(:name => "Teaching of Buddha", :image_url => "/assets/buddha_green.jpg") 
    else
       @product = Product.find_by_name "Teaching of Buddha"
   end
    @purchase = Purchase.create!(:product_id => @product.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end

  end

end
