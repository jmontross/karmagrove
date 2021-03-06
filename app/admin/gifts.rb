ActiveAdmin.register Gift do


  index do
    column :purchase_price
    column :cost
    # default_actions
  end	


  form do |f|

  	  f.inputs "Gift" do 

        f.input :purchase_price
        f.input :cost
        
        # f.input :products 
        @resources = Product.all
        f.input :product, :as => :check_boxes, :selected => @resources, :multiple => false,  :collection => @resources.map {| p| [p.name, p.id] }
        f.input :product_description
        f.input :revenue_donation_percent
        f.input :profit_donation_percent
   		  
        @receivers = User.all
        f.input :users, :as => :check_boxes, :selected => @receivers, :multiple => false,  :collection => @receivers.map {| p| [p.email, p.id] }
        
        @charities = Charity.all
        f.input :product_charities, :as => :check_boxes, :selected => @charities, :multiple => true,  :collection => @charities.map {| p| [p.legal_name, p.id] }
        # f.input :user, :as => :text
        
        # f.input :customer_email

  	  end
      f.buttons
  end
  # form do |f|
  #   f.inputs "Batch" do 
  #     f.input :batch_name
  #     f.input :sales
  #     f.input :state, :as => :radio, :collection => ["open","closed"]
  
  #     f.input :products, :as => :radio, :collection => Product.all.map {| p| [p.name, p.id] }
  #     # TODD : make batch products creatable for a batch,
  #     # f.input :batch_products, :as => :select, :collection => Product.all
  #     #f.input :roles, :as => :radio, :collection => User.roles.map { |role| [I18n.t("active_admin.user.role.#{role.name}"), role.id] }
  #     # batch charity 
  #     @resources = BatchCharity.where(:batch_id => self.id)
  #     f.input :products, :as => :check_boxes, :selected => @resources, :multiple => true,  :collection => Charity.all.map {| p| [p.legal_name, p.id] }
  #     # f.inputs do
  #     #    f.has_many :products do |bc|
  #     #      bc.input :charity_id
  #     #    end
  #     # end
  #   end
  # f.buttons
  # end  

end
