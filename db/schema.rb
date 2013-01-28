# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130128021948) do

  create_table "buyers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "charities", :force => true do |t|
    t.integer  "ein"
    t.string   "legal_name"
    t.string   "city"
    t.string   "state"
    t.string   "deductibility_status"
    t.string   "country"
    t.string   "deductibility_status_description"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "donations", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "charity_id"
    t.decimal  "amount",      :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "donations", ["charity_id"], :name => "index_donations_on_charity_id"
  add_index "donations", ["purchase_id"], :name => "index_donations_on_purchase_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "product_id"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "donation_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "purchases", ["buyer_id"], :name => "index_purchases_on_buyer_id"
  add_index "purchases", ["donation_id"], :name => "index_purchases_on_donation_id"
  add_index "purchases", ["product_id"], :name => "index_purchases_on_product_id"
  add_index "purchases", ["seller_id"], :name => "index_purchases_on_seller_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end