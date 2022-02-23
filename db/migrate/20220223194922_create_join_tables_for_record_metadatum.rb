class CreateJoinTablesForRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    create_join_table :record_metadatum, :subjects
    create_join_table :record_metadatum, :languages
    create_join_table :record_metadatum, :document_types
    create_join_table :record_metadatum, :toponyms
    create_join_table :record_metadatum, :people
  end
end
