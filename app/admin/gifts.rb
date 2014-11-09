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
        f.input :products, :as => :check_boxes, :selected => @resources, :multiple => true,  :collection => @resources.map {| p| [p.name, p.id] }
   
   		 # @receivers = User.all
        # f.input :product_description
        # f.input :customer_email

  	  end

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
