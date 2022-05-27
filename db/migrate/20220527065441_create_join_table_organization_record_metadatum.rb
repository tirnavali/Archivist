class CreateJoinTableOrganizationRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    create_join_table :organizations, :record_metadata
  end
end
