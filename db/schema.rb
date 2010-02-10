# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100206014030) do

  create_table "categories", :force => true do |t|
    t.text    "title"
    t.integer "category_id", :default => 0
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "list_id",                     :null => false
    t.string   "subject",     :default => "", :null => false
    t.text     "text",                        :null => false
    t.integer  "parent_id",   :default => 0,  :null => false
    t.integer  "votes_count", :default => 0
    t.integer  "feature_id"
    t.datetime "datetime"
  end

  create_table "feature_votes", :force => true do |t|
    t.integer  "feature_id",                :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "datetime",                  :null => false
    t.string   "ip"
    t.integer  "points"
    t.boolean  "value",                     :null => false
    t.integer  "list_id",    :default => 0
  end

  create_table "features", :force => true do |t|
    t.integer  "list_id",                                   :null => false
    t.string   "title",               :default => "",       :null => false
    t.integer  "user_id",                                   :null => false
    t.integer  "feature_votes_count", :default => 0,        :null => false
    t.datetime "datetime",                                  :null => false
    t.integer  "points",              :default => 0,        :null => false
    t.integer  "comments_count",      :default => 0
    t.text     "description"
    t.string   "listtype",            :default => "SOCIAL"
    t.string   "login"
  end

  create_table "friends", :force => true do |t|
    t.integer "user_id",   :null => false
    t.integer "friend_id", :null => false
    t.integer "accept"
  end

  create_table "lists", :force => true do |t|
    t.string   "name",                         :default => "", :null => false
    t.text     "description",                                  :null => false
    t.datetime "datetime",                                     :null => false
    t.integer  "user_id",                                      :null => false
    t.integer  "status_id",                                    :null => false
    t.integer  "points",                       :default => 0,  :null => false
    t.text     "tags"
    t.datetime "lastupdate",                                   :null => false
    t.string   "listtype",       :limit => 10, :default => "", :null => false
    t.string   "password"
    t.integer  "comments_count",               :default => 0
    t.integer  "category_id",                  :default => 1,  :null => false
    t.integer  "features_count",               :default => 0
    t.integer  "views_count",                  :default => 0
    t.string   "login"
  end

  add_index "lists", ["category_id"], :name => "index_lists_on_category_id"

  create_table "logs", :force => true do |t|
    t.datetime "datetime"
    t.integer  "user_id",                       :null => false
    t.string   "name"
    t.integer  "list_id"
    t.text     "text",                          :null => false
    t.integer  "comment_id",    :default => 0
    t.integer  "feature_id"
    t.string   "action",        :default => "", :null => false
    t.text     "content"
    t.text     "list_title"
    t.text     "feature_title"
    t.text     "username"
    t.text     "username2"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",                  :null => false
    t.string  "server_url"
    t.string  "salt",       :default => "", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string  "name",        :default => "", :null => false
    t.integer "n",                           :null => false
    t.integer "category_id", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                   :default => "",   :null => false
    t.string   "password"
    t.string   "name"
    t.string   "lastname"
    t.datetime "date_reg"
    t.date     "birthday"
    t.string   "email"
    t.string   "image"
    t.integer  "status",                                                    :null => false
    t.string   "title"
    t.string   "gender"
    t.text     "about"
    t.text     "links"
    t.text     "friendids"
    t.string   "crypted_password",                        :default => "",   :null => false
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
    t.string   "identity_url"
    t.string   "invitecode"
    t.string   "password_salt",                           :default => "",   :null => false
    t.string   "persistence_token"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "twitter_uid"
    t.string   "avatar_url"
  end

  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token"

end
