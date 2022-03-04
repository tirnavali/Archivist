class AddColumnRecordMetadatumToSpecialNumber < ActiveRecord::Migration[7.0]
  def change
    add_reference :special_numbers, :record_metadatum, null: false, foreign_key: true
  end
end
