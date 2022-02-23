class CreateRecordAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :record_attachments do |t|
      t.boolean :completed

      t.timestamps
    end
  end
end
