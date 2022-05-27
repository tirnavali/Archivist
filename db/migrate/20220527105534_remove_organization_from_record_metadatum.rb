class RemoveOrganizationFromRecordMetadatum < ActiveRecord::Migration[7.0]
  def change
    remove_column :record_metadata, :organization_id, :integer
  end
end
