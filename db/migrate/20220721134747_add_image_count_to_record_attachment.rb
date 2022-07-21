class AddImageCountToRecordAttachment < ActiveRecord::Migration[7.0]
  def change
    add_column :record_attachments, :image_count, :integer, default: 0
  end
end
