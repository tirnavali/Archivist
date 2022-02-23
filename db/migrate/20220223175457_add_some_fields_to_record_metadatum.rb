class AddSomeFieldsToRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    add_reference :record_metadata, :Fond, null: false, foreign_key: true
    add_reference :record_metadata, :Organization, null: false, foreign_key: true
    add_reference :record_metadata, :DocumentType, null: false, foreign_key: true
    add_reference :record_metadata, :PhisycalStatus, null: false, foreign_key: true
    add_reference :record_metadata, :Toponym, null: false, foreign_key: true
    add_reference :record_metadata, :Privacy, null: false, foreign_key: true
    add_reference :record_metadata, :Person, null: false, foreign_key: true
    add_reference :record_metadata, :Language, null: false, foreign_key: true
    add_reference :record_metadata, :OrganizationCode, null: false, foreign_key: true
    add_column :record_metadata, :box, :integer
    add_column :record_metadata, :folder, :integer
    add_column :record_metadata, :order, :integer
    add_column :record_metadata, :starting_date, :date
    add_column :record_metadata, :ending_date, :date
    add_column :record_metadata, :explaination, :text
  end
end
