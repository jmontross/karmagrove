ActiveAdmin.register Product do
  index do
    column :name
    column :description
    column "Release Date", :created_at
    column :price do |product|
      number_to_currency product.price, :unit => "&dollar;"
    end
  end
end
