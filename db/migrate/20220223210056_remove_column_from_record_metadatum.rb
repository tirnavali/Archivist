class RemoveColumnFromRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    remove_column :record_metadata, :toponym_id, :integer
    remove_column :record_metadata, :document_type_id, :integer
    remove_column :record_metadata, :person_id, :integer
    remove_column :record_metadata, :language_id, :integer
  end
end 
