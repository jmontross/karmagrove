ActiveAdmin.register Batch do

  form do |f|
  f.inputs "Batch" do
    f.input :batch_name
    f.input :sales
    f.input :state, :as => :radio, :collection => ["open","closed"]
    # TODD : make batch products creatable for a batch,
    # f.input :batch_products, :as => :select, :collection => Product.all
    #f.input :roles, :as => :radio, :collection => User.roles.map { |role| [I18n.t("active_admin.user.role.#{role.name}"), role.id] }
  end
  f.buttons
end

end
