# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_044243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capabilities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_capabilities_on_parent_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "public_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "community_member_capabilities", force: :cascade do |t|
    t.bigint "community_membership_id", null: false
    t.bigint "capability_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["capability_id"], name: "index_community_member_capabilities_on_capability_id"
    t.index ["community_membership_id"], name: "index_community_member_capabilities_on_community_membership_id"
  end

  create_table "community_memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.bigint "street_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_community_memberships_on_community_id"
    t.index ["street_id"], name: "index_community_memberships_on_street_id"
    t.index ["user_id", "community_id"], name: "index_community_memberships_on_user_id_and_community_id", unique: true
    t.index ["user_id"], name: "index_community_memberships_on_user_id"
  end

  create_table "community_moderators", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id", "user_id"], name: "index_community_moderators_on_community_id_and_user_id", unique: true
    t.index ["community_id"], name: "index_community_moderators_on_community_id"
    t.index ["user_id"], name: "index_community_moderators_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "key"
    t.datetime "disabled_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "street_social_networks", force: :cascade do |t|
    t.string "network"
    t.bigint "street_id", null: false
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["street_id"], name: "index_street_social_networks_on_street_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "name", null: false
    t.string "google_places_id"
    t.bigint "community_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id", "name"], name: "index_streets_on_community_id_and_name", unique: true
    t.index ["community_id"], name: "index_streets_on_community_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "superadmin", default: false, null: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "capabilities", "capabilities", column: "parent_id"
  add_foreign_key "community_member_capabilities", "capabilities"
  add_foreign_key "community_member_capabilities", "community_memberships"
  add_foreign_key "community_memberships", "communities"
  add_foreign_key "community_memberships", "streets"
  add_foreign_key "community_memberships", "users"
  add_foreign_key "community_moderators", "communities"
  add_foreign_key "community_moderators", "users"
  add_foreign_key "street_social_networks", "streets"
  add_foreign_key "streets", "communities"
end
