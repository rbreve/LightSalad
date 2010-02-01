# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 33) do

  create_table "categories", :force => true do |t|
    t.text    "title"
    t.integer "category_id", :default => 0
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "list_id",                     :null => false
    t.string   "subject",     :default => "", :null => false
    t.text     "text",        :default => "", :null => false
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
  end

  create_table "friends", :force => true do |t|
    t.integer "user_id",                :null => false
    t.integer "friend_id",              :null => false
    t.integer "accept",    :limit => 2
  end

  create_table "lists", :force => true do |t|
    t.string   "name",                         :default => "", :null => false
    t.text     "description",                  :default => "", :null => false
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
  end

  add_index "lists", ["category_id"], :name => "index_lists_on_category_id"

  create_table "logs", :force => true do |t|
    t.datetime "datetime"
    t.integer  "user_id",                    :null => false
    t.string   "name"
    t.integer  "list_id"
    t.text     "text",       :default => "", :null => false
    t.integer  "comment_id", :default => 0
    t.integer  "feature_id"
    t.string   "action",     :default => "", :null => false
    t.text     "content"
  end

  create_table "tags", :force => true do |t|
    t.string  "name",        :default => "", :null => false
    t.integer "n",                           :null => false
    t.integer "category_id", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.string   "lastname"
    t.datetime "date_reg"
    t.date     "birthday"
    t.string   "email"
    t.string   "image"
    t.integer  "status",    :null => false
    t.string   "title"
    t.string   "gender"
    t.text     "about"
    t.text     "links"
    t.text     "friendids"
  end

end
