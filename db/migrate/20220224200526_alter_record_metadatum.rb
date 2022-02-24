class AlterRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    change_column_null :record_metadata, :fond_id, true
  end
end
