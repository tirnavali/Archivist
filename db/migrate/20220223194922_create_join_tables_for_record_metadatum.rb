class CreateJoinTablesForRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    create_join_table :record_metadata, :subjects
    create_join_table :record_metadata, :languages
    create_join_table :record_metadata, :document_types
    create_join_table :record_metadata, :toponyms
    create_join_table :record_metadata, :people
  end
end
