ActiveRecord::Schema.define(version: 20150415172000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "petition_id", null: false
  end

  add_index "memberships", ["user_id", "petition_id"], name: "index_memberships_on_user_id_and_petition_id", unique: true, using: :btree

  create_table "petitions", force: :cascade do |t|
    t.string  "name",        null: false
    t.text    "description", null: false
    t.string  "image"
    t.integer "owner_id",    null: false
    t.string  "state_id",    null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.string   "username",                                  null: false
    t.string   "image"
    t.string   "affiliation"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
