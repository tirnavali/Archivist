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

ActiveRecord::Schema.define(version: 2022_02_24_201032) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "document_types_documents", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "document_type_id", null: false
  end

  create_table "document_types_record_metadata", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "document_type_id", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.text "summary"
    t.integer "pub_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "language_id"
    t.integer "organization_id"
    t.integer "document_type_id"
    t.integer "phisycal_status_id"
    t.integer "toponym_id"
    t.integer "privacy_id"
    t.integer "person_id"
    t.string "organization_code"
    t.integer "box"
    t.integer "folder"
    t.integer "order"
    t.integer "page_count"
    t.text "explaination"
    t.date "starting_date"
    t.date "ending_date"
    t.integer "fond_id", null: false
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["fond_id"], name: "index_documents_on_fond_id"
    t.index ["language_id"], name: "index_documents_on_language_id"
    t.index ["organization_id"], name: "index_documents_on_organization_id"
    t.index ["person_id"], name: "index_documents_on_person_id"
    t.index ["phisycal_status_id"], name: "index_documents_on_phisycal_status_id"
    t.index ["privacy_id"], name: "index_documents_on_privacy_id"
    t.index ["pub_type_id"], name: "index_documents_on_pub_type_id"
    t.index ["toponym_id"], name: "index_documents_on_toponym_id"
  end

  create_table "documents_languages", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "language_id", null: false
  end

  create_table "documents_people", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "person_id", null: false
  end

  create_table "documents_privacies", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "privacy_id", null: false
  end

  create_table "documents_subjects", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "documents_toponyms", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "toponym_id", null: false
  end

  create_table "fonds", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "depth"
    t.index ["parent_id"], name: "index_fonds_on_parent_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages_record_metadata", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "language_id", null: false
  end

  create_table "number_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people_record_metadata", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "person_id", null: false
  end

  create_table "phisycal_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privacies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pub_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "record_attachments", force: :cascade do |t|
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "record_metadatum_id", null: false
    t.index ["record_metadatum_id"], name: "index_record_attachments_on_record_metadatum_id"
  end

  create_table "record_metadata", force: :cascade do |t|
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fond_id"
    t.integer "organization_id"
    t.integer "phisycal_status_id"
    t.integer "privacy_id"
    t.string "organization_code"
    t.integer "box"
    t.integer "folder"
    t.integer "order"
    t.date "starting_date"
    t.date "ending_date"
    t.text "explaination"
    t.index ["fond_id"], name: "index_record_metadata_on_fond_id"
    t.index ["organization_id"], name: "index_record_metadata_on_organization_id"
    t.index ["phisycal_status_id"], name: "index_record_metadata_on_phisycal_status_id"
    t.index ["privacy_id"], name: "index_record_metadata_on_privacy_id"
  end

  create_table "record_metadata_subjects", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "record_metadata_toponyms", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "toponym_id", null: false
  end

  create_table "special_number_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "special_numbers", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_type_id", null: false
    t.integer "document_id", null: false
    t.index ["document_id"], name: "index_special_numbers_on_document_id"
    t.index ["number_type_id"], name: "index_special_numbers_on_number_type_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "toponyms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.string "name"
    t.string "surname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacations", force: :cascade do |t|
    t.string "explanation"
    t.integer "user_id", null: false
    t.datetime "starting_date", precision: 6
    t.datetime "ending_date", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vacations_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "fonds"
  add_foreign_key "documents", "languages"
  add_foreign_key "documents", "organizations"
  add_foreign_key "documents", "people"
  add_foreign_key "documents", "phisycal_statuses"
  add_foreign_key "documents", "privacies"
  add_foreign_key "documents", "pub_types"
  add_foreign_key "documents", "toponyms"
  add_foreign_key "fonds", "fonds", column: "parent_id"
  add_foreign_key "record_attachments", "record_metadata"
  add_foreign_key "record_metadata", "fonds"
  add_foreign_key "record_metadata", "organizations"
  add_foreign_key "record_metadata", "phisycal_statuses"
  add_foreign_key "record_metadata", "privacies"
  add_foreign_key "special_numbers", "documents"
  add_foreign_key "special_numbers", "number_types"
  add_foreign_key "vacations", "users"
end
