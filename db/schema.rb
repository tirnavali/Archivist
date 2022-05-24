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

ActiveRecord::Schema[7.0].define(version: 2022_05_24_143336) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depth", default: 0, null: false
    t.text "explanation"
    t.index ["parent_id"], name: "index_fonds_on_parent_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_record_metadata", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "language_id", null: false
  end

  create_table "number_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_record_metadata", id: false, force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "person_id", null: false
  end

  create_table "phisycal_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privacies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pub_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_attachments", force: :cascade do |t|
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "record_metadatum_id", null: false
    t.index ["record_metadatum_id"], name: "index_record_attachments_on_record_metadatum_id"
  end

  create_table "record_metadata", force: :cascade do |t|
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "is_secret", default: false
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

  create_table "record_submissions", force: :cascade do |t|
    t.integer "record_metadatum_id", null: false
    t.integer "user_id", null: false
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_metadatum_id"], name: "index_record_submissions_on_record_metadatum_id"
    t.index ["user_id"], name: "index_record_submissions_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "special_number_names", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_numbers", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_type_id", null: false
    t.integer "record_metadatum_id", null: false
    t.index ["number_type_id"], name: "index_special_numbers_on_number_type_id"
    t.index ["record_metadatum_id"], name: "index_special_numbers_on_record_metadatum_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toponyms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "superadmin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vacations", force: :cascade do |t|
    t.string "explanation"
    t.integer "user_id", null: false
    t.datetime "starting_date"
    t.datetime "ending_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "record_submissions", "record_metadata"
  add_foreign_key "record_submissions", "users"
  add_foreign_key "special_numbers", "number_types"
  add_foreign_key "special_numbers", "record_metadata"
  add_foreign_key "vacations", "users"
end
