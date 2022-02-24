class AlterRecordMetadatumFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :record_metadata, :organization_id, true
    change_column_null :record_metadata, :phisycal_status_id, true
    change_column_null :record_metadata, :privacy_id, true
  end
end
