class RemoveColumnFromRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    remove_column :record_metadata, :toponym_id
    remove_column :record_metadata, :document_type_id
    remove_column :record_metadata, :person_id
    remove_column :record_metadata, :language_id
  end
end
