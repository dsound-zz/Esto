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

ActiveRecord::Schema.define(version: 2019_07_24_223219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line1"
    t.string "line2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.integer "old_address_id"
    t.string "address_type"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "old_company_id"
    t.string "name"
    t.string "company_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.boolean "company_status"
    t.string "legacy_compid"
    t.integer "old_address_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "old_contact_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "comapny_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "source"
    t.string "legacy_personid"
    t.string "department"
    t.string "old_address_id"
    t.string "old_company_id"
    t.integer "pers_secTerr"
  end

  create_table "emails", force: :cascade do |t|
    t.integer "email_link_id"
    t.string "email_address"
    t.string "email_intforeignid"
    t.string "email_intid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_deleted"
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.string "email_type"
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
  end

  create_table "employee_projects", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "old_employee_id"
    t.integer "old_project_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "old_employee_id"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "caption"
    t.string "photographer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_number"
    t.string "file_size"
    t.string "keywords"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "old_invoice_id"
    t.string "name"
    t.string "company_phone"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer "old_phone_id"
    t.integer "old_company_id"
    t.integer "old_address_id"
    t.string "phone_type"
    t.string "phone_country_code"
    t.string "phone_area_code"
    t.string "phone_num"
    t.string "phone_ext"
    t.integer "phone_initid"
    t.integer "phone_foreign_id"
    t.string "phonable_type"
    t.bigint "phonable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phonable_type", "phonable_id"], name: "index_phones_on_phonable_type_and_phonable_id"
  end

  create_table "project_contacts", force: :cascade do |t|
    t.integer "project_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "old_project_id"
    t.integer "old_contact_id"
  end

  create_table "project_images", force: :cascade do |t|
    t.integer "image_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_number"
    t.integer "old_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "old_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "old_company_id"
    t.integer "old_contact_id"
    t.integer "old_assigned_userid"
    t.string "description"
    t.string "project_type"
    t.string "pq_worksheet_num"
    t.string "pg_worksheet_notes"
    t.string "scout_images_sent"
    t.string "prelims_sent"
    t.string "finals_delivered"
    t.boolean "shoot_sheet_received"
    t.datetime "image_order_1_date"
    t.datetime "image_order_2_date"
    t.datetime "image_order_3_date"
    t.string "image_order_1_notes"
    t.string "image_order_2_notes"
    t.string "image_order_3_notes"
    t.string "participant_info"
    t.string "other_notes"
    t.string "project_status"
    t.string "location"
    t.string "job_number"
    t.string "old_notes"
    t.integer "company_id"
  end

end
