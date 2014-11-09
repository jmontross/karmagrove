class GiftsController < ApplicationController


# POST /products/:id/purchases
# {"utf8"=>"✓",
#  "authenticity_token"=>"5ZSeSca80hM4tFh/MzRtHcPPUtHPD0nSEc5jn5gIPG8=",
#  "gift"=>{"purchase_price"=>"123",
#  "cost"=>"2134",
#  "products"=>["",
#  "1"],
#  "users"=>["",
#  "1"]},
#  "commit"=>"Create Gift"}
  def create
    Rails.logger.info "test"
    # rails.logger.info "foo"

    respond_to do |format|
      format.html { redirect_to "/admin/gifts", notice: 'Product was successfully updated.' }
      format.json { head :no_content }    
  
    end
  end

end
