class AddIsSecretToRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    add_column :record_metadata, :is_secret, :boolean, default: false
  end
end
