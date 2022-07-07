class AddPageCountToRecordAttachment < ActiveRecord::Migration[7.0]
  def change
    add_column :record_attachments, :page_count, :integer
  end
end
