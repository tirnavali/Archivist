# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_03_172749) do

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.text "summary"
    t.integer "pub_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "language_id"
    t.integer "organization_id"
    t.integer "subject_id"
    t.integer "document_type_id"
    t.integer "phisycal_status_id"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["language_id"], name: "index_documents_on_language_id"
    t.index ["organization_id"], name: "index_documents_on_organization_id"
    t.index ["phisycal_status_id"], name: "index_documents_on_phisycal_status_id"
    t.index ["pub_type_id"], name: "index_documents_on_pub_type_id"
    t.index ["subject_id"], name: "index_documents_on_subject_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phisycal_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pub_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "languages"
  add_foreign_key "documents", "organizations"
  add_foreign_key "documents", "phisycal_statuses"
  add_foreign_key "documents", "pub_types"
  add_foreign_key "documents", "subjects"
end
