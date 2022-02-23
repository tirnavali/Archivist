class AddMetadataToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_reference :record_attachments, :record_metadatum, null: false, foreign_key: true
  end
end
