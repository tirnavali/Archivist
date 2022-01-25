class CreateJoinTableDocumentsDocumentTypes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :documents, :document_types
  end
end
