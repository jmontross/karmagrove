class MarketsController < InheritedResources::Base
    def index
      @disable_sidebar= true
    @markets = Market.all
    if params["name"] && Market.find_by_name(params["name"]).nil? == false
      puts params["name"]
      @products = Market.find_all_by_name(params["name"])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
  def show
    @market = Market.find params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

end
