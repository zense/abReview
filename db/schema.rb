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

ActiveRecord::Schema.define(version: 20181116122947) do

  create_table "abstract_docs", force: :cascade do |t|
    t.string   "title",       :null=>false
    t.string   "attachment",  :null=>false
    t.integer  "category_id", :null=>false, :index=>{:name=>"index_abstract_docs_on_category_id"}
    t.integer  "user_id",     :null=>false, :index=>{:name=>"index_abstract_docs_on_user_id"}
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
    t.integer  "status",      :default=>0, :null=>false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    :null=>false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              :limit=>30, :index=>{:name=>"index_ckeditor_assets_on_type"}
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",        :null=>false
    t.datetime "updated_at",        :null=>false
  end

  create_table "open_houses", force: :cascade do |t|
    t.string   "name",            :null=>false
    t.string   "institute",       :null=>false
    t.string   "branch_of_study", :null=>false
    t.string   "email",           :null=>false
    t.datetime "created_at",      :null=>false
    t.datetime "updated_at",      :null=>false
  end

  create_table "open_studios", force: :cascade do |t|
    t.string   "name",          :null=>false
    t.string   "affiliation",   :null=>false
    t.string   "interested_in", :null=>false
    t.string   "email",         :null=>false
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      :null=>false
    t.text     "content",    :default=>"", :null=>false
    t.string   "slug",       :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",         :null=>false, :index=>{:name=>"index_reviews_on_user_id"}
    t.integer  "abstract_doc_id", :null=>false, :index=>{:name=>"index_reviews_on_abstract_doc_id"}
    t.integer  "originality",     :limit=>1
    t.integer  "expand",          :limit=>1
    t.integer  "impact",          :limit=>1
    t.integer  "methods",         :limit=>1
    t.integer  "clarity",         :limit=>1
    t.text     "comments"
    t.datetime "created_at",      :null=>false
    t.datetime "updated_at",      :null=>false
    t.integer  "status",          :default=>0, :null=>false
    t.string   "attachment"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          :index=>{:name=>"index_roles_on_name"}
    t.string   "resource_type", :index=>{:name=>"index_roles_on_resource_type_and_resource_id", :with=>["resource_id"]}
    t.integer  "resource_id"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false

    t.index ["name", "resource_type", "resource_id"], :name=>"index_roles_on_name_and_resource_type_and_resource_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "meta"
    t.text     "value"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   :null=>false
    t.string   "organisation",           :null=>false
    t.string   "designation"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default=>0, :null=>false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", :index=>{:name=>"index_users_roles_on_user_id"}
    t.integer "role_id", :index=>{:name=>"index_users_roles_on_role_id"}

    t.index ["user_id", "role_id"], :name=>"index_users_roles_on_user_id_and_role_id"
  end

end
