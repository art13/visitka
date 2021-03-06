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

ActiveRecord::Schema.define(:version => 20131207124943) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "books", :force => true do |t|
    t.string   "book_file_name"
    t.string   "alter_name"
    t.string   "book_content_type"
    t.integer  "book_file_size"
    t.datetime "book_updated_at"
    t.integer  "lib_book_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "data_contacts", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "deliver_email"
    t.string   "deliver_pass"
    t.string   "phone"
    t.string   "preview"
    t.text     "about"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "experts", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "secondname"
    t.string   "email"
    t.string   "phone"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "fio"
    t.string   "email",      :null => false
    t.string   "message",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "info_posts", :force => true do |t|
    t.string "title"
    t.text   "content"
  end

  create_table "installators", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.string   "installator_file_name"
    t.string   "installator_content_type"
    t.integer  "installator_file_size"
    t.datetime "installator_updated_at"
  end

  create_table "installments", :force => true do |t|
    t.string   "product_key"
    t.string   "license_key"
    t.string   "installer_version"
    t.integer  "user_id"
    t.integer  "material_id"
    t.string   "status"
    t.text     "info"
    t.integer  "statement"
    t.string   "state"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "lib_books", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "lic_keys", :force => true do |t|
    t.integer "material_id"
    t.integer "order_id"
    t.string  "lic"
    t.string  "status"
  end

  create_table "line_items", :force => true do |t|
    t.integer "order_id"
    t.integer "material_id"
    t.decimal "price"
    t.integer "quantity"
  end

  create_table "materials", :force => true do |t|
    t.string   "name",                 :null => false
    t.string   "version"
    t.string   "installer_version"
    t.string   "preview"
    t.text     "price_description"
    t.decimal  "price"
    t.text     "description"
    t.text     "features"
    t.integer  "installator_id"
    t.string   "release_file_name"
    t.string   "release_content_type"
    t.integer  "release_file_size"
    t.datetime "release_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "orders", :force => true do |t|
    t.decimal  "total"
    t.integer  "number"
    t.datetime "order_create_time"
    t.string   "status"
    t.integer  "user_id"
    t.string   "region"
    t.string   "name"
    t.string   "address"
    t.string   "ogrn"
    t.string   "inn"
    t.string   "phone"
    t.string   "email"
    t.string   "faks"
    t.string   "contact"
    t.string   "manager"
    t.string   "manager_status"
    t.string   "manager_reason"
    t.string   "bank_name"
    t.string   "ras_schet"
    t.string   "kor_schet"
    t.string   "bik"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "preview"
    t.text     "content"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title",              :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "preview",            :null => false
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "subscribers", :force => true do |t|
    t.string "email", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "region"
    t.string   "contact"
    t.string   "company"
    t.string   "phone"
    t.boolean  "interes",                :default => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
