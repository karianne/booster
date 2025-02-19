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

ActiveRecord::Schema.define(version: 2019_03_29_175530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "bios", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title", limit: 255
    t.text "bio"
    t.string "twitter_handle", limit: 255
    t.string "blog", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "picture_file_name", limit: 255
    t.string "picture_content_type", limit: 255
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["user_id"], name: "index_bios_on_user_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.text "comment"
    t.integer "sponsor_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_events_on_sponsor_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "invitees", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "phone_number", limit: 255
    t.integer "user_id"
    t.string "status", limit: 255
    t.string "areas_of_expertise", limit: 255
    t.string "notes", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "departs_at"
    t.datetime "arrives_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string "fiken_sale_uri"
    t.string "stripe_charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference"
    t.index ["fiken_sale_uri"], name: "index_orders_on_fiken_sale_uri"
    t.index ["reference"], name: "index_orders_on_reference"
    t.index ["stripe_charge_id"], name: "index_orders_on_stripe_charge_id"
  end

  create_table "participants", id: :serial, force: :cascade do |t|
    t.integer "talk_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", id: :serial, force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.date "day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "period_type", limit: 255, default: "workshop"
  end

  create_table "registrations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "description", limit: 255
    t.boolean "registration_complete", default: false
    t.string "completed_by", limit: 255
    t.boolean "unfinished"
    t.string "unique_reference", limit: 255
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_registrations_on_deleted_at"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.integer "talk_id"
    t.integer "reviewer_id"
    t.string "subject", limit: 255
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
    t.index ["talk_id"], name: "index_reviews_on_talk_id"
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", id: :serial, force: :cascade do |t|
    t.integer "period_id"
    t.integer "talk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "room_id"
    t.index ["period_id"], name: "index_slots_on_period_id"
    t.index ["room_id"], name: "index_slots_on_room_id"
    t.index ["talk_id"], name: "index_slots_on_talk_id"
  end

  create_table "speakers", id: :serial, force: :cascade do |t|
    t.integer "talk_id"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_speakers_on_deleted_at"
    t.index ["talk_id", "user_id"], name: "index_speakers_on_talk_id_and_user_id"
    t.index ["talk_id"], name: "index_speakers_on_talk_id"
    t.index ["user_id"], name: "index_speakers_on_user_id"
  end

  create_table "sponsor_tickets", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_sponsor_tickets_on_ticket_id", unique: true
  end

  create_table "sponsors", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status", limit: 255
    t.string "contact_person_phone_number", limit: 255
    t.string "location", limit: 255
    t.boolean "was_sponsor_last_year"
    t.datetime "last_contacted_at"
    t.string "contact_person_first_name", limit: 255
    t.string "contact_person_last_name", limit: 255
    t.string "logo_file_name", limit: 255
    t.string "logo_content_type", limit: 255
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "publish_logo", default: false
    t.string "website", limit: 255
    t.index ["user_id"], name: "index_sponsors_on_user_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_talks", id: false, force: :cascade do |t|
    t.integer "talk_id"
    t.integer "tag_id"
    t.index ["tag_id", "talk_id"], name: "index_tags_talks_on_tag_id_and_talk_id"
  end

  create_table "talk_positions", id: :serial, force: :cascade do |t|
    t.integer "talk_id", null: false
    t.integer "slot_id", null: false
    t.integer "position", default: 1
  end

  create_table "talk_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "duration", limit: 255
    t.boolean "eligible_for_cfp"
    t.boolean "eligible_for_free_ticket"
    t.boolean "is_workshop"
  end

  create_table "talks", id: :serial, force: :cascade do |t|
    t.integer "topic_id"
    t.string "title", limit: 255
    t.text "description"
    t.boolean "presenting_naked"
    t.string "video_url", limit: 255
    t.integer "position"
    t.boolean "submitted"
    t.string "audience_level", limit: 255
    t.integer "votes_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "allow_commercial_use"
    t.string "allow_derivatives", limit: 255
    t.string "slide_file_name", limit: 255
    t.string "slide_content_type", limit: 255
    t.integer "slide_file_size"
    t.datetime "slide_updated_at"
    t.integer "period_id"
    t.integer "comments_count"
    t.string "acceptance_status", limit: 255, default: "pending"
    t.boolean "email_sent", default: false
    t.integer "sum_of_votes"
    t.integer "num_of_votes"
    t.integer "talk_type_id"
    t.integer "max_participants"
    t.integer "participants_count", default: 0
    t.string "language", limit: 255
    t.text "participant_requirements"
    t.text "equipment"
    t.string "room_setup", limit: 255
    t.integer "year"
    t.text "outline"
    t.string "appropriate_for_roles", limit: 255
    t.string "type", limit: 255
    t.boolean "speakers_confirmed"
    t.text "speaking_history"
    t.datetime "deleted_at"
    t.boolean "has_slides", default: false, null: false
    t.index ["deleted_at"], name: "index_talks_on_deleted_at"
    t.index ["id", "type"], name: "index_talks_on_id_and_type"
    t.index ["talk_type_id"], name: "index_talks_on_talk_type_id"
  end

  create_table "talks_volunteers", id: false, force: :cascade do |t|
    t.integer "volunteer_id", null: false
    t.integer "talk_id", null: false
    t.index ["talk_id", "volunteer_id"], name: "index_talks_volunteers_on_talk_id_and_volunteer_id"
    t.index ["volunteer_id", "talk_id"], name: "index_talks_volunteers_on_volunteer_id_and_talk_id"
  end

  create_table "ticket_types", id: :serial, force: :cascade do |t|
    t.string "reference", limit: 255
    t.string "name", limit: 255
    t.text "description"
    t.decimal "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "dinner_included", default: true
    t.string "fiken_product_uri"
    t.index ["fiken_product_uri"], name: "index_ticket_types_on_fiken_product_uri"
  end

  create_table "tickets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "company"
    t.string "feedback"
    t.boolean "attend_dinner"
    t.string "dietary_info"
    t.string "roles"
    t.integer "ticket_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference"
    t.boolean "attend_speakers_dinner"
    t.bigint "user_id"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_tickets_on_order_id"
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "crypted_password", limit: 255, null: false
    t.string "password_salt", limit: 255, null: false
    t.string "persistence_token", limit: 255, null: false
    t.string "company", limit: 255
    t.string "phone_number", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip", limit: 255
    t.string "last_login_ip", limit: 255
    t.boolean "is_admin"
    t.string "perishable_token", limit: 255
    t.string "registration_ip", limit: 255
    t.boolean "accepted_privacy_guidelines"
    t.boolean "accept_optional_email"
    t.string "hometown", limit: 255
    t.boolean "female"
    t.integer "birthyear"
    t.boolean "featured_speaker", default: false
    t.boolean "feature_as_organizer", default: false
    t.boolean "invited", default: false
    t.string "dietary_requirements", limit: 255
    t.string "roles", limit: 255
    t.string "city", limit: 255
    t.string "zip", limit: 255
    t.string "gender", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.datetime "deleted_at"
    t.string "hear_about", default: ""
    t.string "unique_reference"
    t.boolean "skeleton_user_registration_finished"
    t.boolean "opt_in_to_email_list", default: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  create_table "volunteers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
  end

  add_foreign_key "sponsor_tickets", "sponsors"
  add_foreign_key "sponsor_tickets", "tickets"
  add_foreign_key "tickets", "orders"
  add_foreign_key "tickets", "ticket_types"
  add_foreign_key "tickets", "users"
end
