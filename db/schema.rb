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

ActiveRecord::Schema.define(version: 2019_07_26_011616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "old_address_id"
    t.string "line1"
    t.string "line2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "old_company_id"
    t.integer "old_address_id"
    t.integer "old_primaryuser_id"
    t.integer "old_createdby_id"
    t.integer "old_comp_seccterr"
    t.integer "old_legacycomp_id"
    t.string "name"
    t.string "website"
    t.boolean "company_status"
    t.string "comp_library_dir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "old_contact_id"
    t.integer "old_address_id"
    t.integer "old_company_id"
    t.integer "old_email_id"
    t.integer "legacy_personid"
    t.integer "pers_secTerr"
    t.datetime "pers_ConflictResDate"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "title"
    t.string "department"
    t.string "source"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
  end

  create_table "emails", force: :cascade do |t|
    t.integer "email_link_id"
    t.string "email_address"
    t.string "email_type"
    t.string "email_deleted"
    t.string "email_intforeignid"
    t.string "email_intid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
  end

  create_table "employee_projects", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "old_employee_id"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "middle_name"
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
    t.string "phone_type"
    t.string "phone_country_code"
    t.string "phone_area_code"
    t.string "phone_num"
    t.string "phone_ext"
    t.string "facetime"
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
  end

  create_table "project_images", force: :cascade do |t|
    t.integer "image_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "old_project_id"
    t.integer "old_company_id"
    t.integer "old_contact_id"
    t.integer "old_employee_id"
    t.integer "old_created_by_id"
    t.string "old_additionalusage"
    t.integer "old_secterr"
    t.integer "old_legacy_id"
    t.integer "invoice_num"
    t.string "job_num"
    t.string "location"
    t.datetime "old_final_date"
    t.string "architect"
    t.string "description"
    t.string "project_type"
    t.string "notes"
    t.string "status"
    t.string "stage"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

end
