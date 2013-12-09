class AddUriToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :uri, :string
  end
end
