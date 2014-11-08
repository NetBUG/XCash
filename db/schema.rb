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

ActiveRecord::Schema.define(version: 20141031030802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], :name => "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "stock_constituents", force: true do |t|
    t.string   "name"
    t.decimal  "amount",     default: 0.0
    t.string   "measure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], :name => "index_stock_constituents_on_name", :unique => true
  end

  create_table "store_categories", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.boolean  "check_age",   default: false
    t.boolean  "show_recipe", default: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["depth"], :name => "index_store_categories_on_depth"
    t.index ["lft"], :name => "index_store_categories_on_lft"
    t.index ["name", "parent_id"], :name => "index_store_categories_on_name_and_parent_id", :unique => true
    t.index ["parent_id"], :name => "index_store_categories_on_parent_id"
    t.index ["rgt"], :name => "index_store_categories_on_rgt"
    t.foreign_key ["parent_id"], "store_categories", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_categories_parent_id"
  end

  create_table "store_menus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_recipes", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.decimal  "price"
    t.string   "color"
    t.boolean  "check_age",   default: false
    t.boolean  "show_recipe", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",      default: 0.0
    t.string   "measure"
    t.index ["category_id"], :name => "index_store_recipes_on_category_id"
    t.index ["name", "category_id"], :name => "index_store_recipes_on_name_and_category_id", :unique => true
    t.foreign_key ["category_id"], "store_categories", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_recipes_category_id"
  end

  create_table "store_menu_items", force: true do |t|
    t.integer  "menu_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["menu_id"], :name => "index_store_menu_items_on_menu_id"
    t.index ["recipe_id"], :name => "index_store_menu_items_on_recipe_id"
    t.foreign_key ["menu_id"], "store_menus", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_menu_items_menu_id"
    t.foreign_key ["recipe_id"], "store_recipes", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_menu_items_recipe_id"
  end

  create_table "store_orders", force: true do |t|
    t.decimal  "cost",       default: 0.0
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "recipe_id"
    t.integer  "amount",     default: 1
    t.decimal  "cost",       default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["order_id"], :name => "index_store_order_items_on_order_id"
    t.index ["recipe_id"], :name => "index_store_order_items_on_recipe_id"
    t.foreign_key ["order_id"], "store_orders", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_order_items_order_id"
    t.foreign_key ["recipe_id"], "store_recipes", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_order_items_recipe_id"
  end

  create_table "store_recipe_components", force: true do |t|
    t.integer  "recipe_id"
    t.decimal  "amount",         default: 0.0
    t.string   "measure"
    t.integer  "constituent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_menu",   default: false
    t.index ["constituent_id"], :name => "index_store_recipe_components_on_constituent_id"
    t.index ["recipe_id"], :name => "index_store_recipe_components_on_recipe_id"
    t.foreign_key ["constituent_id"], "stock_constituents", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_recipe_components_constituent_id"
    t.foreign_key ["recipe_id"], "store_recipes", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_store_recipe_components_recipe_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "roles"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

end
