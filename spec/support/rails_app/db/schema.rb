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

ActiveRecord::Schema.define(version: 20200620215624) do

  create_table "eac_users_support_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.datetime "remember_created_at"
    t.boolean  "administrator",          default: false, null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "eac_users_support_users", ["confirmation_token"], name: "index_eac_users_support_users_on_confirmation_token", unique: true
  add_index "eac_users_support_users", ["email"], name: "index_eac_users_support_users_on_email", unique: true
  add_index "eac_users_support_users", ["invitation_token"], name: "index_eac_users_support_users_on_invitation_token", unique: true
  add_index "eac_users_support_users", ["invitations_count"], name: "index_eac_users_support_users_on_invitations_count"
  add_index "eac_users_support_users", ["invited_by_id"], name: "index_eac_users_support_users_on_invited_by_id"

end
