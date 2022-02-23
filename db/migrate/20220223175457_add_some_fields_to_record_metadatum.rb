class AddSomeFieldsToRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    add_reference :record_metadata, :fond, null: false, foreign_key: true
    add_reference :record_metadata, :organization, null: false, foreign_key: true
    add_reference :record_metadata, :document_type, null: false, foreign_key: true
    add_reference :record_metadata, :phisycal_status, null: false, foreign_key: true
    add_reference :record_metadata, :toponym, null: true, foreign_key: true
    add_reference :record_metadata, :privacy, null: false, foreign_key: true
    add_reference :record_metadata, :person, null: true, foreign_key: true
    add_reference :record_metadata, :language, null: false, foreign_key: true
    add_column :record_metadata, :organization_code, :string
    add_column :record_metadata, :box, :integer
    add_column :record_metadata, :folder, :integer
    add_column :record_metadata, :order, :integer
    add_column :record_metadata, :starting_date, :date
    add_column :record_metadata, :ending_date, :date
    add_column :record_metadata, :explaination, :text
  end
end
