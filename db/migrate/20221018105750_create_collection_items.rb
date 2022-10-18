class CreateCollectionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_items do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :record_metadatum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
