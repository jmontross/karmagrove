class AddEmailSubscriberToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_subscriber, :boolean
  end
end
