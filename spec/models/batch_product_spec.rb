require 'spec_helper'

describe BatchProduct do
  it "should find batch products for a batch" do

    @batch = Batch.create(:batch_name => "awesome batch")
    @product = Product.create(:name => "awesome item in a batch")
    @batch_product = BatchProduct.create(:batch_id => @batch.id, :product_id => @product.id)
    @batch.batch_products.first.product.id.should == @product.id
  end
end
