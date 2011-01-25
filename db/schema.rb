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

ActiveRecord::Schema.define(:version => 20110122031258) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "email",           :limit => 100, :default => "", :null => false
    t.string   "hashed_password", :limit => 40
    t.string   "phone",           :limit => 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",        :limit => 25
    t.string   "salt",            :limit => 40
  end

  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "admin_users_products", :id => false, :force => true do |t|
    t.integer "admin_user_id"
    t.integer "product_id"
  end

  add_index "admin_users_products", ["admin_user_id", "product_id"], :name => "index_admin_users_products_on_admin_user_id_and_product_id"

  create_table "cargo_edits", :force => true do |t|
    t.integer  "admin_user_id"
    t.integer  "cargo_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cargo_edits", ["admin_user_id", "cargo_id"], :name => "index_cargo_edits_on_admin_user_id_and_cargo_id"

  create_table "cargos", :force => true do |t|
    t.integer  "product_id"
    t.integer  "worker_id"
    t.string   "status"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cargos", ["product_id"], :name => "index_cargos_on_product_id"
  add_index "cargos", ["worker_id"], :name => "index_cargos_on_worker_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "brand"
    t.string   "name"
    t.string   "modelnr"
    t.string   "serialnr"
    t.integer  "supplier_id"
    t.integer  "price"
    t.datetime "date_purchased"
    t.text     "info"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"

  create_table "suppliers", :force => true do |t|
    t.integer  "product_id"
    t.string   "company_name"
    t.string   "business_nr"
    t.string   "fiscal_nr"
    t.string   "owner"
    t.string   "address"
    t.string   "phone"
    t.boolean  "status",             :default => false
    t.text     "services"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "suppliers", ["product_id"], :name => "index_suppliers_on_product_id"

  create_table "workers", :force => true do |t|
    t.string   "first_name",    :limit => 25
    t.string   "last_name",     :limit => 50
    t.string   "uni_nr"
    t.string   "date_employed"
    t.string   "profesion"
    t.string   "departament"
    t.string   "office"
    t.string   "email",                       :default => "", :null => false
    t.string   "password",      :limit => 40
    t.string   "phone",         :limit => 15
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
