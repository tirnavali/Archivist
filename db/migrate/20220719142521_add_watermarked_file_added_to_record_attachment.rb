class AddWatermarkedFileAddedToRecordAttachment < ActiveRecord::Migration[7.0]
  def change
    add_column :record_attachments, :watermarked, :boolean, default: false
  end
end
