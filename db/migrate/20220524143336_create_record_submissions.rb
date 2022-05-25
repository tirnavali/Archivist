class CreateRecordSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :record_submissions do |t|
      t.references :record_metadatum, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
