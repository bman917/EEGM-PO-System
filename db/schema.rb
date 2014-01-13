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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140109161518) do

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", force: true do |t|
    t.string   "phone_type"
    t.string   "number"
    t.integer  "contact_detail_id"
    t.string   "contact_detail_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "purchase_order_id"
    t.float    "price"
    t.integer  "quantity"
    t.float    "total"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
  end

  add_index "purchase_items", ["item_id"], name: "index_purchase_items_on_item_id", using: :btree
  add_index "purchase_items", ["purchase_order_id"], name: "index_purchase_items_on_purchase_order_id", using: :btree

  create_table "purchase_order_contacts", force: true do |t|
    t.integer  "purchase_order_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_order_contacts", ["purchase_order_id"], name: "index_purchase_order_contacts_on_purchase_order_id", using: :btree

  create_table "purchase_orders", force: true do |t|
    t.integer  "supplier_id"
    t.text     "notes"
    t.date     "po_date"
    t.float    "grand_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id", using: :btree

  create_table "supplier_items", force: true do |t|
    t.integer  "supplier_id"
    t.integer  "item_id"
    t.float    "price"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supplier_items", ["item_id"], name: "index_supplier_items_on_item_id", using: :btree
  add_index "supplier_items", ["supplier_id"], name: "index_supplier_items_on_supplier_id", using: :btree

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "contact_detail_id"
    t.string   "contact_detail_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
