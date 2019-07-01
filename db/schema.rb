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

ActiveRecord::Schema.define(version: 2019_07_01_014544) do

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
    t.boolean "address_type"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "old_company_id"
    t.string "name"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.boolean "company_status"
    t.string "library_dir"
    t.index ["addressable_type", "addressable_id"], name: "index_companies_on_addressable_type_and_addressable_id"
  end

  create_table "company_projects", force: :cascade do |t|
    t.integer "company_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "old_contact_id"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "office_email"
    t.string "personal_email"
    t.string "facetime"
    t.string "office_phone"
    t.string "cell_phone"
    t.string "personal_phone"
    t.string "fax"
    t.integer "comapny_id"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_contacts_on_addressable_type_and_addressable_id"
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
    t.string "email"
    t.string "office_phone"
    t.string "cell_phone"
    t.string "home_address_line1"
    t.string "home_address_line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "old_image_id"
    t.string "file_num"
    t.string "caption"
    t.string "location"
    t.string "photographer"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "old_invoice_id"
    t.string "name"
    t.string "company_phone"
    t.integer "project_id"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_invoices_on_addressable_type_and_addressable_id"
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
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "email"
    t.string "office_phone"
    t.string "cell_phone"
    t.string "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
