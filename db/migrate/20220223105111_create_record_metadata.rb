class CreateRecordMetadata < ActiveRecord::Migration[7.0]
  def change
    create_table :record_metadata do |t|
      t.text :summary

      t.timestamps
    end
  end
end
