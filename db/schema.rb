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

ActiveRecord::Schema.define(:version => 20141203093416) do

  create_table "appointments", :force => true do |t|
    t.string   "sched"
    t.text     "remarks"
    t.integer  "procedure_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "appointments", ["procedure_id"], :name => "index_appointments_on_procedure_id"

  create_table "inventories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.boolean  "action"
    t.integer  "user_id"
    t.text     "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "inventories", ["product_id"], :name => "index_inventories_on_product_id"
  add_index "inventories", ["user_id"], :name => "index_inventories_on_user_id"

  create_table "invoice_details", :force => true do |t|
    t.integer  "quantity"
    t.decimal  "price"
    t.string   "type"
    t.integer  "type_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invoice_details", ["type_id"], :name => "index_invoice_details_on_type_id"

  create_table "invoice_invoice_details", :force => true do |t|
    t.integer  "invoice_id"
    t.integer  "invoice_detail_id"
    t.text     "remarks"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "invoice_invoice_details", ["invoice_detail_id"], :name => "index_invoice_invoice_details_on_invoice_detail_id"
  add_index "invoice_invoice_details", ["invoice_id"], :name => "index_invoice_invoice_details_on_invoice_id"

  create_table "invoices", :force => true do |t|
    t.integer  "patient_id"
    t.decimal  "total_amt_due"
    t.decimal  "amt_received"
    t.decimal  "balance"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "invoices", ["patient_id"], :name => "index_invoices_on_patient_id"

  create_table "patients", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.date     "birthday"
    t.string   "contact"
    t.boolean  "sex"
    t.string   "status"
    t.string   "occupation"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "procedures", :force => true do |t|
    t.string   "procedure"
    t.string   "tooth_no"
    t.text     "remarks"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "patient_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.boolean  "type"
    t.decimal  "capital_price"
    t.decimal  "selling_price"
    t.text     "info"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
